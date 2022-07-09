// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import {Turbo} from "@hotwired/turbo-rails"

Turbo.session.drive = false

// import "./controllers"
// import * as bootstrap from "bootstrap"
//
import "./src/jquery"

window.addEventListener('DOMContentLoaded', () => {
    $('.select2').select2({
        theme: 'bootstrap4',
            templateResult: addUserPic,
        templateSelection: addUserPic
    })
})
$(document).ready(function () {
    $(".select2-tags").select2({
        tags: true,
        theme: 'bootstrap4'
        // tokenSeperators: [','],
        // theme: 'bootstrap',
        // placeholder: 'seperated by space'
    });
});

function addUserPic(opt) {

    if (!opt.id) {
        return opt.text;
    }
    var optimage = $(opt.element).data('image');
    if (!optimage) {
        return opt.text;
    } else {
        var $opt = $(
            '<span class="userName"><img width="64px" src="' + optimage + '" class="userPic" /> ' + $(opt.element).text() + '</span>'
        );
        return $opt;
    }
};

//
// let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
// let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
//   return new bootstrap.Popover(popoverTriggerEl)
// })
// $('.dropdown-toggle').dropdown()

// import "./vendor/vendor"
// import "./vendor/app"
// import "./vendor/core"

