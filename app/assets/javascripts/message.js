$(document).on('turbolinks:load', function() {

  function display(text, image_url){
    var html;
    if(text!=null){
      html = `${text}`
    } else {
      html = `<img src="${image_url}">`
    }
    return html;
  }

  function buildHTML(chat){

    var content = display(chat.text, chat.image_url)

    var html = `<div class="mainChat__box">
                  <div class="mainChat__boxUpper">
                    <div class="mainChat__boxName">${chat.user_name}</div>
                    <div class="mainChat__boxTime">${chat.created_at}</div>
                  </div>
                  <div class="mainChat__boxMessage">
                    ${content}
                  </div>
                </div>`
    return html;
  }

  $(".mainForm__wrap").on('submit', function(e){
    e.preventDefault();
    console.log(this);
    var formData = new FormData(this);
    console.log(formData);
    var url = $(this).attr('action');
    console.log(url);

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.mainChat').append(html);
      $('#mainForm__input').val('');
      $('#mainForm__input').prop('disabled', false);
      $('#imageUpload').val('');
      $('#imageUpload').prop('disabled', false);
      $('.mainForm__imageUpload').removeClass('disabled');
      $('.cancelBtn').removeClass('active');
      $(".mainChat").animate({scrollTop: $(".mainChat")[0].scrollHeight}, 1500);
    })
    .fail(function(){
      alert("メッセージの送信に失敗しました。");
    })
  });
});
