document.addEventListener("turbolinks:load", () => {
  window.storedFiles = new Map();

  $(".js-new-image-button").click(function(){
    $(".js-carousel-input").click();
  });

  $(".save-carousel-images").click(function(){
    let fileList = Array.from(window.storedFiles.values());
    if (fileList.length > 0){
      var formData = new FormData();
      for(let i = 0;i < fileList.length;i++){
        formData.append("files[]", fileList[i], fileList[i]["name"]);
      }

      $.ajax({
        type: "POST",
        url: "/homepages",
        data: formData,
        processData: false,
        contentType: false,
        success: function(response){
          location.reload();
        },
        error: function(){
          console.error("Error upon uploading files");
        }
      });
    }
  });

  $(".js-carousel-input").change(function(){
    var fileList = $(".js-carousel-input")[0].files;
    for(let i = 0;i < fileList.length;i++){
      let index = Date.now() + Math.random();
      window.storedFiles.set(index, fileList[i]);
      $(".new-files").append(`<p class="new-file" data-id="${index}">${fileList[i]["name"]}<i class="bi bi-dash-circle js-remove-image discard-button" data-id="${index}"></i></p>`);
    }
  });

  $(document).on('click', ".js-remove-image", function(){
    let element = $(this);
    let seekId = element.data("id");

    $(".new-file").each(function(index){
      let elementId = $(this).data("id");
      if (elementId === seekId) {
        window.storedFiles.delete(elementId);
        $(this).remove();
      }
    });

  });
});
