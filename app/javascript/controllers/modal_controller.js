// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   static targets = ["modal", "title","description"]


//   connect() {
//     this.visible = false
//     this.currentGameKey = null
//   }

//   toggle(event) {
//     console.log("CONNECTED")
//     // event.stopPropagation()
//     const button = event.currentTarget
//     console.log(button)
//     const gameKey = button.dataset.gameName
//     console.log(gameKey)
//     if (this.visible && this.currentGameKey === gameKey) {
//       this.hideModal()
//     } else {
//       this.currentGameKey = gameKey
//       this.titleTarget.textContent = button.dataset.gameName
//       this.descriptionTarget.textContent = button.dataset.gameDescription
//       this.showModal()
//     }
//   }

//   showModal() {
//     console.log("ShowModal")
//     this.modalTarget.classList.remove("hidden")
//     this.modalTarget.classList.add("flex")
//     this.visible = true
//   }

//   hideModal() {
//     this.modalTarget.classList.add("hidden")
//     this.modalTarget.classList.remove("flex")
//     this.visible = false
//     this.currentGameKey = null
//   }

//   close(event) {
//     if (event.target === this.modalTarget) {
//       this.hideModal()
//     }
//   }
// }


import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "title", "description"]

  connect() {
    console.log("Modal controller connected!");
    this.visible = false;
  }

  toggle(event) {
    event.preventDefault();
    event.stopPropagation();

    if (this.visible) {
      this.hideModal();
    } else {
      this.showModal();
      // Set content from clicked button's data attributes
      this.titleTarget.textContent = event.currentTarget.dataset.gameName;
      this.descriptionTarget.textContent = event.currentTarget.dataset.gameDescription;
    }
  }

  showModal() {
    this.modalTarget.classList.remove("hidden");
    this.modalTarget.classList.add("flex");
    this.visible = true;
    document.body.style.overflow = "hidden"; // Prevent scrolling
  }

  hideModal() {
    this.modalTarget.classList.add("hidden");
    this.modalTarget.classList.remove("flex");
    this.visible = false;
    document.body.style.overflow = ""; // Re-enable scrolling
  }

  close(event) {
    if (event.target === this.modalTarget) {
      this.hideModal();
    }
  }

  // Add this to handle clicks inside modal
  stop(event) {
    event.stopPropagation();
  }
}
