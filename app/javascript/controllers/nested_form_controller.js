import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["list", "template"]

  add(e) {
    e.preventDefault()
    const html = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, Date.now().toString())
    this.listTarget.insertAdjacentHTML("beforeend", html)
  }

  remove(e) {
    e.preventDefault()
    const row = e.target.closest("[data-nested-form-row]")
    const destroy = row.querySelector("input[name*='_destroy']")
    if (destroy) {
      destroy.value = "1"
      row.style.display = "none"
    } else {
      row.remove()
    }
  }
}
