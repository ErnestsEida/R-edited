document.addEventListener("turbolinks:load", () => {
  $('#bookmark_icon').click(function(){
    var post_id = $("#bookmark_icon").data("id");
    console.log(post_id);
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
  switch(bookmark_status){
    case true:
      $('#bookmark_icon').attr("class", "bi bi-bookmark-fill")
      break;
    case false:
      $('#bookmark_icon').attr("class", "bi bi-bookmark")
      break;
  }
}
