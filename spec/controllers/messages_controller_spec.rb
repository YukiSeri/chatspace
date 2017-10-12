require 'rails_helper'

describe MessagesController do
  let(:user) { create(:user) }
  # userをcreateし、let内に格納

  context 'When user can log-in' do
    before do
      login_user(user)
      # controller_macros.rb内のlogin_userメソッドを呼び出し
    end
  end

  context 'When user dont log-in' do

  end

end
