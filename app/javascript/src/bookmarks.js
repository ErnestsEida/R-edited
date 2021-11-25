document.addEventListener("turbolinks:load", () => {
  $('#bookmark_icon').click(function(){
    var post_id = $("#bookmark_icon").data("id");
    $.ajax({
      type: "POST",
      url: "/bookmarked_posts/"+post_id+"/bookmark",
      success: function(response){
        changeBookmarkIcon(response["bookmark"]);
      },
      error: function(){
        console.error("Error occured in bookmarking process!");
      }
    });
  });
});

function changeBookmarkIcon(bookmark_status){
    if(bookmark_status == true)
    {
      $('#bookmark_icon').attr("class", "bi bi-bookmark-fill");
    }
    else
    {
      $('#bookmark_icon').attr("class", "bi bi-bookmark");
    }
}
