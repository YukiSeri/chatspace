$(document).on('turbolinks:load', function() {
  if($(".mainChat").length){
    $(".mainChat").scrollTop($(".mainChat")[0].scrollHeight);
  }
});
