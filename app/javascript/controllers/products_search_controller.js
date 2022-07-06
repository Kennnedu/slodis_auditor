import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="products-search"
export default class extends Controller {
  static targets = ["input", "product", "clearButton"]

  connect() {
  }

  search() {
    const keyword = this.inputTarget.value

    if(!!keyword) {
      this.clearButtonTarget.classList.remove('d-none')
      this.productTargets.forEach(productNode => {
        const barcodeDiv = productNode.querySelector('.barcode');
        const barcodeText = productNode.dataset.barcode

        if(!barcodeText.includes(keyword)) {
          productNode.classList.add('d-none')
        } else {
          productNode.classList.remove('d-none')
          barcodeDiv.innerHTML = barcodeText.replace(new RegExp('('+keyword+')','ig'), '<mark>$1</mark>')
        }
      })
    } else {
      this.stopSearch()
    }
  }

  stopSearch() {
    this.clearButtonTarget.classList.add('d-none')
    this.inputTarget.value = ""
    this.productTargets.forEach(productNode => {
      const barcodeDiv = productNode.querySelector('.barcode')
      const barcodeText = productNode.dataset.barcode

      productNode.classList.remove('d-none')
      barcodeDiv.innerHTML = barcodeText
    })
  }
}
