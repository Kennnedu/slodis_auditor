import bootstrap from "bootstrap/dist/js/bootstrap"
import $ from 'jquery'

$(document).on('turbolinks:load', function() {
  var toastElList = [].slice.call(document.querySelectorAll('.toast'))
  var toastList = toastElList.map(function (toastEl) {
    return new bootstrap.Toast(toastEl).show();
  })
});
