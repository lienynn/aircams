import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["start_date", "end_date"]
  calc() {
    console.log(this.start_dateTarget.innerText)
  }
}
