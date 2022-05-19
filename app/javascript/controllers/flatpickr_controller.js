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
      dateFormat: 'n/j/Y',
      onClose: function(selectedDates, dateStr, instance) {
        let daysInRange = document.getElementsByClassName('inRange');
        let daysLengthTotal = daysInRange.length + 1;
        console.log(daysLengthTotal);
      }
    });


    // flatpickr(".start_datepicker", {
    //   minDate: "today",
    //   onChange: function(selectedDates, dateStr) {
    //     const start_date = dateStr
    //   }
    // });

    // flatpickr(".end_datepicker", {
    //   minDate: "today",
    //   onChange: function(selectedDates, dateStr) {
    //     const end_date = dateStr
    //   }
    // });
  }


}
