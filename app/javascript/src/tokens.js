document.addEventListener("turbolinks:load", () => {
  let userId = null;
  let $tokenAmountElement;

  $(".js-add-tokens-button").click(function(){
    userId = $(this).data("id");
    $tokenAmountElement = $(this).parents("tr").find(".js-token-count");
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
        success: function(response){
          $tokenAmountElement.text(response["new_token_count"]);
        },
        error: function() {
          console.log("Error occured on token sending");
        }
      })
    }
  })

})
