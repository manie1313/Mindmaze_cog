import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game"
export default class extends Controller {
  static targets = ["score", "lastScore"]
  // static values = {
  //   score: Number
  // }

  connect() {
    console.log("Connected")
    // console.log(this.scoreTarget)
    // console.log(this.lastScoreTarget)
    const TARGET = this.scoreTarget;
    const LASTTARGET = this.lastScoreTarget
    window.addEventListener("message", (event) => {
    console.log("Message received:", event);

    if (event.data.type === "bestScore") {
      // console.log(`Best score ${event.data.value}`)
      this.scoreValue = event.data.value
      // console.log(TARGET)
      TARGET.value = event.data.value;
      // console.log(TARGET.value)
    }

    if (event.data.type === "lastScore") {
      this.lastScoreValue = event.data.value;
      LASTTARGET.value = event.data.value;
      // console.log(LASTTARGET.value);
    }


    });

  }
}
