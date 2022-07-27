import { Controller } from "@hotwired/stimulus"

let test = "test";

export default class extends Controller {

  static targets = [ "key0", "key1", "key2", "key3", "key4", "key5", "key6", "key7", "key8", "key9", "key10", "key11", "key12", "img", "number" ]

  connect() {
    console.log("lala");
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
