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
      success: function(){
        $('#post-awards').append(`<img src="${self.src}" class="post-award"/>`);
        $("#awardsSelectModal").modal("hide");
      },
      error: function(){
        console.error("Error occured in reward process!");
      }
    });
  });
});
