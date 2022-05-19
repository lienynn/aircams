import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin';

export default class extends Controller {

  connect() {
    this.pickerLoader()
  }

  pickerLoader() {
    flatpickr("#start_datepicker", {
      // mode: "range",
      minDate: "today",
      // dateFormat: 'n/j/Y',
      "plugins": [new rangePlugin({ input: '#end_datepicker'})],
      onChange: function(selectedDates, dateStr, instance) {
        let daysInRange = document.getElementsByClassName('inRange');
        let daysLength = daysInRange.length + 1
        let daily_price = document.getElementById('daily-price').innerText
        let total_price = daily_price * daysLength
        document.getElementById('total-price').innerText = `Total price: ${total_price} CAD`
      }
    });
  }


}
