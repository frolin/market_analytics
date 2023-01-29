# Pin npm packages by running ./bin/importmap

pin "application"

pin_all_from "app/javascript/vendor", under: "vendor"
pin_all_from "app/javascript/lib", under: "lib"

pin "utils"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@4.1.1/dist/chart.js"
pin "@kurkle/color", to: "https://ga.jspm.io/npm:@kurkle/color@0.3.1/dist/color.esm.js"
