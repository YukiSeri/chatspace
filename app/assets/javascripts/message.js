$(document).on('turbolinks:load', function() {
  $(".mainForm__wrap").on('submit', function(e){
    e.preventDefault();
    console.log(this);
  });
});
