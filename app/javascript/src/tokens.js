document.addEventListener("turbolinks:load", () => {
  var userId = null;

  $(".js-add-tokens-button").click(function(){
    userId = $(this).data("id");
  })

  $("#js-add-tokens").click(function(){
    let tokenAmount = $("input[name='token_amount']").val();

    if (userId !== null && tokenAmount !== "") {
      let formData = new FormData();
      formData.append("amount", tokenAmount);

      $.ajax({
        type: "PUT",
        url: `/users/${userId}/add_tokens`,
        data: formData,
        processData: false,
        contentType: false,
        success: function(){
          location.reload();
        },
        error: function() {
          console.log("Error occured on token sending");
        }
      })
    }
  })

})
