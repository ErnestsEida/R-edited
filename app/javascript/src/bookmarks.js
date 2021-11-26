document.addEventListener("turbolinks:load", () => {
  $('#bookmark_icon').click(function(){
    var post_id = $("#bookmark_icon").data("id");
    $.ajax({
      type: "POST",
      url: "/bookmarked_posts/"+post_id+"/bookmark",
      success: function(response){
        changeBookmarkIcon(response["bookmarked"]);
      },
      error: function(){
        console.error("Error occured in bookmarking process!");
      }
    });
  });
});

function changeBookmarkIcon(bookmarkedStatus){
    var bookmarkedClass = "bi bi-bookmark";

    console.log("BOOKMARK STATUS TYPE: ",typeof bookmarkedStatus, bookmarkedStatus);

    if (bookmarkedStatus) {
        bookmarkedClass = "bi bi-bookmark-fill";
    }

    console.log("BOOKMARKCLASS : ",bookmarkedClass);
    $('#bookmark_icon').attr("class", bookmarkedClass);
}
