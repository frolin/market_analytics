# Pin npm packages by running ./bin/importmap

pin "application"

pin_all_from "app/javascript/vendor", under: "vendor"
pin "utils"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
