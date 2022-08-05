import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "img" ]

  connect() {
    document.getElementById("img0").click();
  }

  setBackground() {
    const images = document.querySelectorAll("img").forEach((img) => {
      img.addEventListener("click", (event) => {
        event.preventDefault();
        let url = event.currentTarget.className;
        this.imgTarget.setAttribute("src", url);
      })
    });
  }
}
