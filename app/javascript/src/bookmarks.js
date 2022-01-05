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

  $(".js-comment-input").keyup(function(){
    adjustTextarea(this);
  });
});

function adjustTextarea(element){
  element.style.height = "1px";
  element.style.height = (25 + element.scrollHeight)+"px"
}

function changeBookmarkIcon(bookmarkedStatus){
    var bookmarkedClass = "bi bi-bookmark";

    if (bookmarkedStatus) {
        bookmarkedClass = "bi bi-bookmark-fill";
    }

    $('#bookmark_icon').attr("class", bookmarkedClass);
}
