# Pin npm packages by running ./bin/importmap

pin "jquery", preload: true
pin "application", preload: true

pin_all_from "app/javascript/vendor", under: "vendor"