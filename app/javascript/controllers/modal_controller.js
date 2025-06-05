import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "title","description"]


  connect() {
    this.visible = false
    this.currentGameKey = null
  }

  toggle(event) {
    console.log("CONNECTED")
    // event.stopPropagation()
    const button = event.currentTarget
    console.log(button)
    const gameKey = button.dataset.gameName
    console.log(gameKey)
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
    console.log("ShowModal")
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
