document.addEventListener("turbolinks:load", () => {
  $(".js-award").bind("click", function(){
    const self = this;
    const postId = $(this).data("post");
    const awardId = $(this).data("award");
    const postData = {
      post_id: postId,
      award_id: awardId,
    };

    $.ajax({
      type: "POST",
      url: "/reward/",
      data: postData,
      success: function(response){
        if (response["bought"]) {
          $('#post-awards').append(`<img src="${self.src}" class="post-award"/>`);
          $("#awardsSelectModal").modal("hide");
        }
      },
      error: function(){
        console.error("Error occured in reward process!");
      }
    });
  });

  let originalValue;
  $(document).on("focusout", ".js-value-input", function() {
    $self = $(this);
    let value = $self.val();
    let awardId = $self.data("id");
    value = (value === "") ? "1" : value;
    value = parseInt(value);
    data = {
      value: value,
    }

    $.ajax({
      type: "PUT",
      url: `/admin/awards/${awardId}`,
      data: data,
      success: function() {
        $self.replaceWith(`<i class="js-award-value" data-id="${awardId}">${value}</i>`)
      },
      error: function() {
        $self.replaceWith(`<i class="js-award-value" data-id="${awardId}">${originalValue}</i>`)
      }
    })
  })

  $(document).on("dblclick", ".js-award-value", function() {
    let value = $(this).html();
    let awardId = $(this).data("id");
    originalValue = value;
    $(this).replaceWith(`<input class='js-value-input' data-id='${awardId}' type='number' step='1' value='${value}'/>`)
  })
});
