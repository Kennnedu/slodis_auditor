import $ from 'jquery';
import BarcodeReader from 'barcode-reader';

$(document).on('turbolinks:load', function() {
  BarcodeReader.Init();

  var localized = [];
  var streaming = false;
  var c, ctx, video, stream;

  BarcodeReader.StreamCallback = function(result) {
    $('#product_barcode').val(result[0]['Value']);
    closeBarcode();
  };

  BarcodeReader.SetLocalizationCallback(function(result) {
    localized = result;
  });

  BarcodeReader.SwitchLocalizationFeedback(true);
  c = document.getElementById("videoCanvas");
  ctx = c.getContext("2d");

  video = document.createElement("video");
  video.setAttribute('autoplay', '')
  video.setAttribute('playsinline', '')
  video.width = 640;
  video.height = 480;

  function draw() {
    try {
      ctx.drawImage(video, 0, 0, c.width, c.height);
      if (localized.length > 0) {
        ctx.beginPath();
        ctx.lineWIdth = "2";
        ctx.strokeStyle = "red";
        for (var i = 0; i < localized.length; i++) {
          ctx.rect(localized[i].x, localized[i].y, localized[i].width, localized[i].height);
        }
        ctx.stroke();
      }
      setTimeout(draw, 20);
    } catch (e) {
      if (e.name == "NS_ERROR_NOT_AVAILABLE") {
        setTimeout(draw, 20);
      } else {
        throw e;
      }
    }
  }

  async function startStream(constraints) {
    stream = await navigator.mediaDevices.getUserMedia(constraints);
    video.srcObject = stream;
    video.play();
    draw();
    streaming = true;
  }

  function closeBarcode() {
    BarcodeReader.StopStreamDecode();
    stream.getTracks()[0].stop();
    $('#product-form').show();
    $('#scanner').hide();
  }

  $('#start-scan').on('click', function(){
    if ('mediaDevices' in navigator && navigator.mediaDevices.getUserMedia) {
      const updatedConstraints = {
        video: {
          width: {
            min: 1280,
            ideal: 1920,
            max: 2560,
          },
          height: {
            min: 720,
            ideal: 1080,
            max: 1440
          },
          facingMode: 'environment'
        },
        audio: false
      };
      startStream(updatedConstraints);
    }
    
    // navigator.getUserMedia = (navigator.getUserMedia ||
    //   navigator.webkitGetUserMedia ||
    //   navigator.mozGetUserMedia ||
    //   navigator.msGetUserMedia);

    // if (navigator.getUserMedia) {
    //   navigator.getUserMedia({
    //       video: true
    //     },
    //     function(localMediaStream) {
    //       stream = localMediaStream;
    //       video.srcObject = localMediaStream;
    //       video.play();
    //       draw();
    //       streaming = true;
    //     },
    //     function(err) {
    //       console.log("The following error occured: " + err);
    //     }
    //   );
    // } else {
    //   console.log("getUserMedia not supported");
    // }
    
    // if (!streaming) return;
    BarcodeReader.DecodeStream(video);
    $('#product-form').hide();
    $('#scanner').show();
  })

  $('#stop-scan').on('click', closeBarcode)
});
