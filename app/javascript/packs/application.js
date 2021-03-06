// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("jquery")
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "trix/dist/trix"
import "@rails/actiontext"

import "bootstrap/dist/js/bootstrap";
import "bootstrap-icons/font/bootstrap-icons";
import "@yaireo/tagify/src/tagify.scss"

import "src/awards.js"
import "src/bookmarks.js"
import "src/tagging.js"
import "src/post_banner.js"
import "src/admin.js"
import "src/theme.js"
import "src/confirmation.js"
import "src/tokens.js"

document.addEventListener("turbolinks:load", () => {
 $('[data-toggle="tooltip"]').tooltip();
 $('[data-toggle="popover"]').popover();
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")
