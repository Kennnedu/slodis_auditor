import { Controller } from "@hotwired/stimulus"
import debounce from 'src/debounce'

// Connects to data-controller="barcode-hint"
export default class extends Controller {
  static classes = ["loading", "absent", "exist"]
  static targets = ["input", "suggestions"]

  connect() {
    this.barcode = this.inputTarget.value;
    this.barcodeSuggestions = new Array;
    this.inputTarget.addEventListener('input', debounce(() => this.call(), 800));
    this.inputTarget.addEventListener('change', debounce(() => this.call(), 0));
  }

  async call() {
    const newBarcode = this.inputTarget.value;

    // clear state when input is empty
    if(!newBarcode) {
      this.clearState();
      return;
    }

    // do nothing when barcode is unchanged
    if (this.barcode === newBarcode) {
      return;
    }

    this.clearState();
    this.barcode = newBarcode;

    // selected from datatalist
    if (this.barcodeSuggestions.includes(this.barcode)) {
      this.element.classList.add(this.existClass);
      return;
    }

    // fetch product_kinds
    this.toggleLoading();
    const result = await fetch(`/product_kinds.json?barcode=${newBarcode}`)
    const barcodeObjectList = await result.json()
    this.barcodeSuggestions = barcodeObjectList.map(obj => obj.barcode)
    this.renderSuggestions();
    console.log(this.barcodeSuggestions);
    this.toggleLoading();

    if(this.barcodeSuggestions.length === 0) {
      // warning
      this.element.classList.add(this.absentClass);
    } else if(this.barcodeSuggestions.length === 1 && this.barcodeSuggestions[0] === this.barcode) {
      // success
      this.element.classList.add(this.existClass);
    } else {
      // warning + suggestions
      this.element.classList.add(this.absentClass);
    }
  }

  renderSuggestions() {
    this.suggestionsTarget.innerHTML = this.barcodeSuggestions.map(value => `<option>${value}</option>`).join(' ');
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
    this.element.classList.remove(this.existClass, this.absentClass);
    this.inputTarget.classList.remove('valid', 'is-invalid');
    this.suggestionsTarget.innerHtml = '';
  }
}
