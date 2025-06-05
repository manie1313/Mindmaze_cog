import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "title", "description"]

  connect() {
    this.visible = false
    this.currentGameKey = null
  }

  toggle(event) {
    event.stopPropagation()
    const button = event.currentTarget
    const gameKey = button.dataset.gameName

    if (this.visible && this.currentGameKey === gameKey) {
      this.hideModal()
    } else {
      this.currentGameKey = gameKey
      this.titleTarget.textContent = button.dataset.gameName
      this.descriptionTarget.textContent = button.dataset.gameDescription
      this.showModal()
    }
  }

  showModal() {
    this.modalTarget.classList.remove("hidden")
    this.modalTarget.classList.add("flex")
    this.visible = true
  }

  hideModal() {
    this.modalTarget.classList.add("hidden")
    this.modalTarget.classList.remove("flex")
    this.visible = false
    this.currentGameKey = null
  }

  close(event) {
    if (event.target === this.modalTarget) {
      this.hideModal()
    }
  }
}

