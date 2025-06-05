import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "title", "description"]
  static values = { currentGameId: String }

  toggle(event) {
    event.preventDefault()
    event.stopPropagation()

    const gameId = event.params.gameId
    const gameName = event.currentTarget.dataset.gameName
    const gameDescription = event.currentTarget.dataset.gameDescription

    if (this.currentGameIdValue === gameId && !this.modalTarget.classList.contains("hidden")) {
      this.hide()
    } else {
      this.currentGameIdValue = gameId
      this.titleTarget.textContent = gameName
      this.descriptionTarget.textContent = gameDescription
      this.show()
    }
  }

  show() {
    this.modalTarget.classList.remove("hidden")
    this.modalTarget.classList.add("flex")
    document.body.style.overflow = "hidden"
  }

  hide() {
    this.modalTarget.classList.add("hidden")
    this.modalTarget.classList.remove("flex")
    document.body.style.overflow = ""
    this.currentGameIdValue = ""
  }

  close(event) {
    if (event.target === this.modalTarget) {
      this.hide()
    }
  }
}
