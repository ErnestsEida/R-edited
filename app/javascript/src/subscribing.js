import Cookies from 'js-cookie';
const Axios = require('axios');

document.addEventListener("turbolinks:load", () => {
  let $modal = $(".subscriber-modal");
  if ($modal.length) {
    if (Cookies.get("first-visit") === undefined){
      setTimeout(() => {
        $modal.show();
        Cookies.set("first-visit", true);
      }, 5000);
    }
  }

  $("#closeSubscriberModal").click(() => {
    $(".subscriber-modal").hide();
  });

  $("#acceptSubscriberModal").click(() => {
    Axios.post("/users/subscribe").then(() => {
      $(".subscriber-modal").hide();
    }).catch(() => {
      console.error("Error on subscription!");
    });
  });
})
