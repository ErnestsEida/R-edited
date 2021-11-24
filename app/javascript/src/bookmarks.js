document.addEventListener("turbolinks:load", () => {
  $('#bookmark_icon').click(function(){
    var split_url = window.location.href.split("/");
    var post_id = split_url[split_url.length - 1];
    $.ajax({
      type: "PUT",
      url: "/bookmarked_post/" + post_id,
      success: function(response, status){
          changeBookmarkIcon(response["bookmark"]);
      },
      error: function(){
        alert("Error occured when bookmarking!");
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

function getIconStatus(idName){
  switch(idName)
  {
    case "bi bi-bookmark":
      return true;
      break
    case "bi bi-bookmark-fill":
      return false;
      break
    default:
      return null;
      break
  }
}
