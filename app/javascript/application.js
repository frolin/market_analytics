// Entry point for the build script in your package.json


// !IMPORTANT
import './src/jquery'


import * as moment from 'moment';
import 'moment/locale/ru';
import 'daterangepicker'
moment.locale("ru")
import _ from 'lodash';

import * as bootstrap from "bootstrap"
// import 'bootstrap-select'


import "./controllers"

//
//
// import "@hotwired/turbo-rails"
// Turbo.session.drive = false




// import './utils/jquery.bootstrap-touchspin'


// import Turn from '@domchristie/turn'
// Turn.start()

// addEventListener("turbo:load", (event) => {
//   // document.body.classList.add("animate__animated", "animate__fadeIn");
// })

// document.addEventListener("turbo:before-visit", function () {
//   console.log("BEFORE VISIT!")
//   document.querySelector("body").classList.add("fade-out");
// });
//
// document.addEventListener("turbo:load", function () {
//     console.log("LOAD TURBO!!")
//
//   document.querySelector("body").classList.remove("fade-out");
//   document.querySelector("body").classList.add("fade-in");
// });

//
//
// $(document).ready(function () {
//   $(".select2-tags").select2({
//     // tags: true,
//     theme: 'bootstrap4'
//     // tokenSeperators: [','],
//     // theme: 'bootstrap',
//     // placeholder: 'seperated by space'
//   });
// });

//


//
// $('.date-range-picker').daterangepicker({
//     format: 'mm/dd/yyyy',
//     startDate: '-3d'
// });

// $(function () {
//     $('input[name="date_range"]').daterangepicker({
//         opens: 'left',
//         locale: {
//             format: 'DD-MM-YYYY'
//         }
//     }, function (start, end, label) {
//         $('#date-picker').val(
//             $('#datepicker').datepicker('getFormattedDate')
//         );
//         console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
//     });
// });

// });
//

//

let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})


$('.datepicker').daterangepicker({
  alwaysShowCalendars: true,
  autoApply: true,
  singleDatePicker: true,

}).on('apply.daterangepicker', function (e, picker) {
  // if (selectedRange) {
  //   picker.show();
  //   selectedRange = false;
  // }
  // $('#date-submit').click();
});


// $('.dropdown-toggle').dropdown()

// import "./vendor/vendor"
// import "./vendor/app"
// import "./vendor/core"

