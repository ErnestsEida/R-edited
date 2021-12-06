document.addEventListener("turbolinks:load", () => {
  $(".js-banner-cancel").click(function(){
    postId = $(this).data("post");
    communityId = $(this).data("community");
    $.ajax({
      type: "DELETE",
      url: `/communities/${communityId}/posts/${postId}/remove_banner`,
      success: function(){
        $('.post-form').load(document.URL +  ' .post-form');
      },
      error: function(){
        console.error("Error upon deleting banner!");
      }
    });
  });
});
