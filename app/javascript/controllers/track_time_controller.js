import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "timeInput"]

  connect() {
    this.startTime = new Date()
    console.log("Time tracking started at:", this.startTime)

    if (this.hasFormTarget) {
      this.formTarget.addEventListener("submit", this.recordTime.bind(this))
    } else {
      console.warn("Form target not found.")
    }
  }

  recordTime(event) {
    const endTime = new Date()
    const minutesSpent = ((endTime - this.startTime) / 60000).toFixed(2)

    if (this.hasTimeInputTarget) {
      this.timeInputTarget.value = minutesSpent
      console.log(`Time spent: ${minutesSpent} minutes`)
    } else {
      console.warn("timeInput target not found.")
    }
  }
}
