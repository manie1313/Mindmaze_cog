import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["info"]

  connect() {
    // Immediately hide all description cards
    this.infoTargets.forEach(card => {
      card.style.display = 'none'
    })
  }

  showInfo(event) {
    const gameId = event.currentTarget.dataset.gameId
    this.hideAllInfo() // First hide any open cards

    const infoCard = this.infoTargets.find(
      info => info.dataset.gameId === gameId
    )

    if (infoCard) {
      infoCard.style.display = 'block'
    }
  }

  hideInfo(event) {
    const infoCard = event.currentTarget.closest(".description-card")
    infoCard.style.display = 'none'
  }

  hideAllInfo() {
    this.infoTargets.forEach(info => {
      info.style.display = 'none'
    })
  }
}
