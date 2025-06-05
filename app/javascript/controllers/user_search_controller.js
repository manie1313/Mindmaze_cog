import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "results"]

  connect() {
    this.handleDocumentClick = this.hideResults.bind(this)
    document.addEventListener("click", this.handleDocumentClick)
    console.log("user_search controller connected", this.element)
  }

  disconnect() {
    document.removeEventListener("click", this.handleDocumentClick)
  }

  search() {
    const query = this.inputTarget.value.trim()

    if (query.length === 0) {
      this.resultsTarget.innerHTML = ""
      this.resultsTarget.style.display = "none"
      return
    }

    fetch(`/users/search?query=${encodeURIComponent(query)}`)
      .then(response => {
        console.log("Fetch response status:", response.status)
        return response.json()
      })
      .then(data => {
        console.log("Search results data:", data)
        this.resultsTarget.innerHTML = data.map(user => `
          <a
            href="/profiles/${encodeURIComponent(user.username)}"
            data-action="click->user-search#selectResult"
            class="dropdown-item d-flex align-items-center gap-2"
            role="button"
          >
            <img src="${user.avatar_url}" alt="${user.username}" class="rounded-circle" style="width: 32px; height: 32px;">
            <span><strong>${user.username}</strong> (${user.full_name})</span>
          </a>
        `).join("")

        this.resultsTarget.style.display = "block"
      })
      .catch(error => {
        console.error("Fetch error:", error)
      })
  }

  selectResult(event) {
    console.log("Selected result:", event.currentTarget.href)
    this.resultsTarget.style.display = "none"
  }

  hideResults(event) {
    if (!this.element.contains(event.target)) {
      this.resultsTarget.style.display = "none"
    }
  }
}
