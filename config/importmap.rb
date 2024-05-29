# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery", to: "/assets/plugins/jquery/jquery.min.js"
pin "bootstrap", to: "/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"
pin "AdminLTE-3.2.0", to: "/assets/dist/js/adminlte.min.js"
