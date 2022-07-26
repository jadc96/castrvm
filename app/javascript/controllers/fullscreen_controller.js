import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "key", "top" ]

  connect() {
    console.log("Hello there!")
  }

  setBackground() {
    var key = "\"background-image: <%= cl_image_tag(\"" + this.keyTarget.innerText + "\")\""
    console.log(key)
    this.topTarget.setAttribute("style", key)
  }
}
