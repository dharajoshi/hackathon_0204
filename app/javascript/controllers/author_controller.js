import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="author"
export default class extends Controller {
  static targets = ["authorswelcome", "name", "email", "nameError", "emailError"]
  connect() {
    this.authorswelcomeTarget.innerText = "Welcome Dhara"
    setTimeout(()=>{
      this.authorswelcomeTarget.innerText = "Testing Author Module"
    }, 2000)    
  }

  showDetails() {
    this.authorswelcomeTarget.innerText = "Showing Author Details"
  }
}
