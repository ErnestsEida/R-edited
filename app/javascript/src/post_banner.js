document.addEventListener("turbolinks:load", () => {
  $(".js-remove-banner").change(function(){
    if (this.checked){
      $("#post_banner").hide();
    } else {
      $("#post_banner").show();
    }
  });
});
