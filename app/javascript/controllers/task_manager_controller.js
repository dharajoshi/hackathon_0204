import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task-manager"
export default class extends Controller {
  static targets = ["title", "description", "status", "titleError", "descriptionError", "statusError", "form"]
  connect() {
    console.log("loading task manager")
  }

  showForm(event) {
    event.preventDefault();
    this.formTarget.classList.toggle("hidden");
  }

  create(event) {
    let isValid = true;

    if (this.titleTarget.value.trim() === "") {
      isValid = false;
      this.titleErrorTarget.classList.remove("hidden")
    } else {
      this.titleErrorTarget.classList.add("hidden")
    }

    if (this.descriptionTarget.value.trim() === "") {
      isValid = false;
      this.descriptionErrorTarget.classList.remove("hidden")
    } else {
      this.descriptionErrorTarget.classList.add("hidden")
    }

    if (this.statusTarget.value.trim() === "") {
      isValid = false;
      this.statusErrorTarget.classList.remove("hidden")
    } else {
      this.statusErrorTarget.classList.add("hidden")
    }

    if (!isValid) {
      event.preventDefault()
    }
  }
}
