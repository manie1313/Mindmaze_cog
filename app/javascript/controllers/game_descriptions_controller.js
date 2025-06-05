import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["info"]

  showInfo(event) {
    const gameId = event.currentTarget.dataset.gameId
    this.hideAllInfo() // First hide any currently open info cards

    const infoCard = this.infoTargets.find(
      info => info.dataset.gameId === gameId
    )

    if (infoCard) {
      infoCard.style.display = "block"
      // Small delay to allow display block to take effect before animation
      setTimeout(() => {
        infoCard.classList.add("visible")
      }, 10)
    }
  }

  hideInfo(event) {
    const infoCard = event.currentTarget.closest(".description-card")
    infoCard.classList.remove("visible")
    // Wait for transition to complete before hiding
    setTimeout(() => {
      infoCard.style.display = "none"
    }, 300)
  }

  hideAllInfo() {
    this.infoTargets.forEach(info => {
      info.classList.remove("visible")
      // setTimeout(() => {
        info.style.display = "none"
      // }, 300)
    })
  }
}
