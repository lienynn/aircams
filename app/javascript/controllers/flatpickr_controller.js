import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {

  connect() {
    console.log("connected")
    this.pickerLoader()
  }

  pickerLoader() {
    flatpickr(".datepicker", {
      minDate: "today",
      onChange: function(selectedDates) {
        console.log(selectedDates)
      }
    });
  }

}
