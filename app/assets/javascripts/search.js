$(document).on('turbolinks:load', function() {

  var search_list = $(".user-search-result");
  var member_list = $("#chat-group-users");

  function appendUser(user) {
   var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name">${user.name}</p>
                <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
              </div>`
    search_list.append(html);
  }

  function appendNouser(user) {
    var html = `<div class="chat-group-user clearfix">
                 <p class="chat-group-user__name">${user}</p>
               </div>`
    search_list.append(html);
  }

  function addUser(id, name) {
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value='${id}'>
                  <p class='chat-group-user__name'>${name}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
    member_list.append(html);
  }

  $(".chat-group-form__input").on("keyup", function(){
    var input = $(this).val();
    console.log(input);

    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(users) {
      $("#chat-group-users").empty();
      if (users.length !== 0){
        users.forEach(function(user){
          appendUser(user);
        });
      }
      else {
        appendNouser("一致するユーザーはいません");
      }
    })
    .fail(function() {
      alert('ユーザー検索に失敗しました');
    })
  });

  $(".chat-group-form").on("click", ".user-search-add", function(){
    var id = $(this).data('userId');
    var name = $(this).data('userName');
    addUser(id, name);
    var user = $(this).parent();
    user.remove();
  });

  $(".chat-group-form").on("click", ".user-search-remove", function(){
    var user = $(this).parent();
    user.remove();
  });

});
