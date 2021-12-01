// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
 require("jquery")
 import Rails from "@rails/ujs"
 import Turbolinks from "turbolinks"
 import * as ActiveStorage from "@rails/activestorage"
 import "channels"

 import "bootstrap/scss/bootstrap";
 import 'bootstrap/dist/js/bootstrap';
 import "bootstrap/dist/css/bootstrap";
 import "bootstrap-icons/font/bootstrap-icons";
 import "@yaireo/tagify/src/tagify.scss"

 import "src/bookmarks.js"
 import "src/tagging.js"

 document.addEventListener("turbolinks:load", () => {
   $('[data-toggle="tooltip"]').tooltip();
   $('[data-toggle="popover"]').popover();
 })

Rails.start()
Turbolinks.start()
ActiveStorage.start()
