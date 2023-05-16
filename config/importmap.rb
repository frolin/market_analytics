# Pin npm packages by running ./bin/importmap

# pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.4/dist/jquery.js", preload: true
pin "moment" # @2.29.4
pin "daterangepicker" # @3.1.0


pin_all_from "app/javascript/vendor", under: "vendor"
pin_all_from "app/javascript/lib", under: "lib"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.0/dist/jquery.js", preload: true
pin "application", preload: true

pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

pin "select2", to: "https://ga.jspm.io/npm:select2@4.1.0-rc.0/dist/js/select2.js"


pin "@domchristie/turn/dist/turn.js", to: "turn.js"
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@4.1.1/dist/chart.js"
pin "@kurkle/color", to: "https://ga.jspm.io/npm:@kurkle/color@0.3.1/dist/color.esm.js"

pin "animate.css", to: "https://ga.jspm.io/npm:animate.css@4.1.1/animate.css"
