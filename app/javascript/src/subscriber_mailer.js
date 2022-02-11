const Axios = require('axios');

document.addEventListener("turbolinks:load", () => {
  $(".js-send-subscribers-button").click(function() {
    $self = $(this);
    let event_id = $self.data("id");
    let data = {
      event_id: event_id,
    };

    Axios.post("/admin/send_newspost_message", data).then(() => {
      $self.removeClass("bi-envelope").addClass("bi-envelope-check");
    }).catch(() => {
      console.error("Error occured when sending message");
    });
  });
})
