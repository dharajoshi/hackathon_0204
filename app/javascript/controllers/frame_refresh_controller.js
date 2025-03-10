import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { ids: [] }

  refresh() {

    this.idsValue.forEach((id) => {
      const frame = document.getElementById(id)
      if (frame) {
        const content = frame.querySelector('[role="content"]')
        content.textContent = "refreshing..."
        frame.src = frame.src
      }
    })
  }
}