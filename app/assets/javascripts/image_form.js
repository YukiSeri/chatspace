$(document).on('turbolinks:load', function() {
  // テキストが入力されたら、画像ファイル挿入は不可能とする
  $('#mainForm__input').on('change', function(){
    var text = $(this).val()
    if(text == ""){
      $('#imageUpload').prop('disabled', false);
      $('.mainForm__imageUpload').removeClass('disabled');
    } else {
      $('#imageUpload').prop('disabled', true);
      $('.mainForm__imageUpload').addClass('disabled');
    }
  });
  // 画像ファイルが選択されたら、テキストを挿入して入力は不可能とする
  $('#imageUpload').on('change', function(){
    var name = $(this)[0].files[0].name;
    $('#mainForm__input').val('Upload file : ' + name);
    $('#mainForm__input').prop('disabled', true);
    $('.cancelBtn').toggleClass('active');
  });

  $('.cancelBtn').on('click', function(){
    $('#mainForm__input').val("");
    $('#imageUpload').val("");
    $('#mainForm__input').prop('disabled', false);
    $('.cancelBtn').toggleClass('active');
  });
});
