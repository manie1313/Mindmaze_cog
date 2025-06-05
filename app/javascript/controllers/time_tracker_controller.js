import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.startTime = new Date()
    console.log("Time tracking started at:", this.startTime)

    const form = document.querySelector("[data-track-time-target='form']")
    if (form) {
      form.addEventListener("submit", this.recordTime.bind(this))
    } else {
      console.warn("Time tracking form not found.")
    }
  }

  recordTime(event) {
    const endTime = new Date()
    const minutesSpent = ((endTime - this.startTime) / 60000).toFixed(2)

    const timeInput = document.getElementById("time-spent")
    if (timeInput) {
      timeInput.value = minutesSpent
      console.log(`Time spent: ${minutesSpent} minutes`)
    } else {
      console.warn("Time-spent input not found.")
    }
  }
}
