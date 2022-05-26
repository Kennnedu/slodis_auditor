import { Controller } from "@hotwired/stimulus"
import IMask from "imask";

// Connects to data-controller="number-mask"
export default class extends Controller {
  connect() {
    this.mask = IMask(this.element, { mask: Number });
  }

  disconnect() {
    this.mask.destroy();
  }
}
