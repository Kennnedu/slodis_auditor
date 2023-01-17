import { Controller } from "@hotwired/stimulus"
import debounce from 'src/debounce'

// Connects to data-controller="barcode-storage-checker"
export default class extends Controller {
  static classes = [ "loading", "absent", "exist" ]
  static targets = [ "input" ]

  connect() {
    this.barcode = this.inputTarget.value;
    this.inputTarget.addEventListener('keyup', debounce(() => this.call(), 800));
    this.inputTarget.addEventListener('change', debounce(() => this.call(), 800));
  }

  async call() {
    const input = this.inputTarget
    const newBarcode = input.value;

    // clear state when input is empty
    if(!newBarcode) {
      this.clearState();
      return null
    }

    // do nothing when barcode not changed
    if (this.barcode === newBarcode) {
      return null;
    }

    this.clearState();
    this.barcode = newBarcode;
    this.toggleLoading();

    const result = await fetch(`/product_kinds.json?barcode=${newBarcode}`)
    const resJson = await result.json()

    this.toggleLoading();

    if(resJson.length) {
      // valid
      this.element.classList.add(this.existClass);
    } else {
      // invalid
      this.element.classList.add(this.absentClass);
    }
  }

  toggleLoading() {
    if(this.loading) {
      this.loading.remove();
      this.loading = null;
    } else {
      this.loading = document.createElement('div');
      this.loadingClasses.forEach(el => this.loading.classList.add(el))
      this.element.append(this.loading);
    }
  }

  // clear previous state
  clearState() {
    this.element.classList.remove(this.existClass);
    this.element.classList.remove(this.absentClass);
    this.inputTarget.classList.remove('valid');
    this.inputTarget.classList.remove('is-invalid');
  }
}
