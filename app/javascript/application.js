// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false

import "./controllers"
import * as bootstrap from "bootstrap"

import "./src/jquery"

let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})
$('.dropdown-toggle').dropdown()

import "./vendor/vendor"
import "./vendor/app"
import "./vendor/core"
