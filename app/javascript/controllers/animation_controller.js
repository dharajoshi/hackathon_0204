import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["message"]

  connect(){
    console.log("connected")
  }

  changeColor() {
    this.messageTarget.textContent = "Currently showing"
    setTimeout(() => {
      this.messageTarget.textContent = "";
    }, 4000);
  }
}