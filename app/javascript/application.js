// Entry point for the build script in your package.json

// !IMPORTANT
import './src/jquery'

import * as moment from 'moment';
import 'moment/locale/ru';
import 'daterangepicker'

moment.locale("ru")
import _ from 'lodash';
import * as bootstrap from "bootstrap"

//
// import "@hotwired/turbo-rails"
//
// Turbo.session.drive = true


import "./controllers"


import './utils/jquery.bootstrap-touchspin'
import './utils'

import 'select2'

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


// Chart.defaults.global.defaultFontFamily = "Lato";
// Chart.defaults.global.defaultFontSize = 18;
// Chart.defaults.global.defaultFontColor = 'red';

// window.addEventListener('DOMContentLoaded', () => {
//     console.log('Chart: ', Chart)
// })
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

// export class Select2Init {
//   start() {
//     $(function() {
//       $('.select2').select2()
//     })
//   }
// }
//
// new Select2Init().start()

// $(document).ready(function () {
//   $('.select2').select2({
//     theme: 'bootstrap4',
//     templateResult: addUserPic,
//     templateSelection: addUserPic
//   });
// });

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
function addUserPic(opt) {
  if (!opt.id) {
    return opt.text;
  }
  var optimage = $(opt.element).data('image');
  if (!optimage) {
    return opt.text;
  } else {
    var $opt = $(
      '<span class="userName"><img width="32px" src="' + optimage + '" class="userPic" /> ' + $(opt.element).text() + '</span>'
    );
    return $opt;
  }
};
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

