import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="barcode-input-validator"
export default class extends Controller {
  connect() {
    this.element.addEventListener('keyup', this.validate);
  }

  async validate(e) {
    const element = e.target
    const barcode = element.value;
    const result = await fetch(`/product_kinds.json?barcode=${barcode}`)
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
