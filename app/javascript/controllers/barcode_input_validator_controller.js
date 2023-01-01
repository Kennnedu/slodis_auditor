import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="barcode-input-validator"
export default class extends Controller {
  connect() {
    this.element.addEventListener('change', validate);
  }

  async validate(e) {
    const barcode = e.target.value;
    const result = await fetch(`/product_kinds.json?barcode=${barcode}`)
    console.log(result);
  }
}
