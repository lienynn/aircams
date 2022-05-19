import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["start_date", "end_date"]
  calc() {
    console.log("hello from new_rental_controller!")
  }
}
