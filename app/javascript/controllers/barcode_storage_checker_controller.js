import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="barcode-storage-checker"
export default class extends Controller {
  connect() {
    this.barcode = this.element.value;
    this.element.addEventListener('keyup', _e => this.call());
    this.element.addEventListener('change', _e => this.call());
  }

  async call() {
    const element = this.element
    const newBarcode = element.value;

    if (this.barcode === newBarcode) {
      return null;
    }

    this.barcode = newBarcode;

    const result = await fetch(`/product_kinds.json?barcode=${newBarcode}`)
    const resJson = await result.json()

    if(resJson.length) {
      // valid
      element.classList.add('is-valid');
      element.classList.remove('is-invalid');
    } else {
      // invalid
      element.classList.add('is-invalid');
      element.classList.remove('is-valid');
    }
  }
}
