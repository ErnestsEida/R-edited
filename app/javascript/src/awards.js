document.addEventListener("turbolinks:load", () => {
  $(".award").bind("click", function(){
    var title = $(this).data("title");
    $("#award-title").html(title);
  });

  $("#approve-award").click(function(){
    var post_id = $(this).data("id");
    var award = getAward();
    var postData = {};
    postData["post_id"] = post_id;
    postData["award_id"] = award["id"];

    if (award["id"] !== null){
      $.ajax({
        type: "POST",
        url: "/reward/",
        data: postData,
        error: function(){
          console.error("Error occured in reward process!");
        }
      });
    }
    else{
      // NO AWARD SELECTED
    }
  });
});

function getAward(){
  var awards = document.getElementsByName("award");
  var selectedAward = {};

  for(var i = 0;i < awards.length;i++){
    if (awards[i].checked){
      selectedAward["id"] = awards[i].value;
      return selectedAward;
    }
  }
  selectedAward["id"] = null;
  return selectedAward;
}
