document.addEventListener("turbolinks:load", () => {
  $(".award").bind("click", function(){
    var post_id = $(this).data("post");
    var award_id = $(this).data("award");
    var postData = {};
    postData["post_id"] = post_id;
    postData["award_id"] = award_id;

    $.ajax({
      type: "POST",
      url: "/reward/",
      data: postData,
      success: function(){
        $('#post-awards').load(document.URL +  ' #post-awards');
        $("#awardsSelectModal").modal("hide");
      },
      error: function(){
        console.error("Error occured in reward process!");
      }
    });
  });
});
