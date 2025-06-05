import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game"
export default class extends Controller {
  static targets = ["score"]
  static values = {
    score: Number
  }

  connect() {
    console.log("Connected")
    console.log(this.scoreTarget)
    window.addEventListener("message", function(event) {
    console.log("Message received:", event);

    if (event.data.type === "bestScore") {
      console.log(`Best score ${event.data.value}`)
      this.scoreValue = event.data.value
      console.log(this.scoreValue)
      this.scoreTarget.value = this.scoreValue;
    }
    });
  }

  getScore() {
    console.log("Got score")
  }
}
