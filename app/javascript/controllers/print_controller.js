import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="print"
export default class extends Controller {
  connect() {
    this.element.addEventListener('click', function() {
      window.print();
    });
  }
}
