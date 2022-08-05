import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timeout"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      location.reload()
    }, 5000);
  }

}
