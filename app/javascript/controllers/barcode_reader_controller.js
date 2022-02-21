import { Controller } from "@hotwired/stimulus"
import $ from 'jquery';
import BarcodeReader from 'barcode-reader';

// Connects to data-controller="barcode-reader"
export default class extends Controller {
  static targets = ["canvas", "input", "scanner", "startButton", "stopButton", "form"];

  connect() {
    let controller = this;

    BarcodeReader.Init();
    controller.localized = [];
    controller.streaming = false;
    controller.ctx = controller.canvasTarget.getContext("2d");
    controller.stream  = null;

    controller.video = document.createElement("video");
    controller.video.setAttribute('autoplay', '')
    controller.video.setAttribute('playsinline', '')
    controller.video.width = 640;
    controller.video.height = 480;

    BarcodeReader.StreamCallback = function(result) {
      controller.inputTarget.value = result[0]['Value'];
      controller.stop();
    };

    BarcodeReader.SetLocalizationCallback(function(result) {
      controller.localized = result;
    });
  }

  draw() {
    let ctr = this;
    try {
      ctr.ctx.drawImage(ctr.video, 0, 0, ctr.canvasTarget.width, ctr.canvasTarget.height);
      if (ctr.localized.length > 0) {
        ctr.ctx.beginPath();
        ctr.ctx.lineWIdth = "2";
        ctr.ctx.strokeStyle = "red";
        for (var i = 0; i < ctr.localized.length; i++) {
          ctr.ctx.rect(ctr.localized[i].x, ctr.localized[i].y, ctr.localized[i].width, ctr.localized[i].height);
        }
        ctr.ctx.stroke();
      }
      setTimeout(() => ctr.draw(), 20);
    } catch (e) {
      if (e.name == "NS_ERROR_NOT_AVAILABLE") {
        setTimeout(() => ctr.draw(), 20);
      } else {
        throw e;
      }
    }
  }

  async startStream(constraints) {
    this.stream = await navigator.mediaDevices.getUserMedia(constraints);
    this.video.srcObject = this.stream;
    this.video.play();
    this.draw();
    this.streaming = true;
  }

  stop() {
    BarcodeReader.StopStreamDecode();
    this.stream.getTracks()[0].stop();
    $(this.formTarget).show();
    $(this.scannerTarget).hide();
    $(this.stopButtonTarget).hide();
    $(this.startButtonTarget).show();
  }

  start() {
    if ('mediaDevices' in navigator && navigator.mediaDevices.getUserMedia) {
      const updatedConstraints = {
        video: {
          width: 640,
          height: 480,
          facingMode: 'environment',
          focusMode: 'continuous'
        },
        audio: false
      };
      this.startStream(updatedConstraints);
    }

    BarcodeReader.DecodeStream(this.video);
    $(this.startButtonTarget).hide()
    $(this.formTarget).hide()
    $(this.scannerTarget).show()
    $(this.stopButtonTarget).show()
  }
}
