require 'rails_helper'

describe MessagesController do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { create(:message) }

  describe 'GET #index' do
    context 'When user can log-in' do
      before do
        login_user(user)
      end

      it "renders the :index template" do
        get :index, params: { group_id: group }
        expect(response).to render_template :index
      end

      # it "assigns the requested contact to @groups" do
      #   @group = user.groups.first
      #   get :index, params: { group_id: @group.id }
      #   groups = user.groups
      #   except(assigns(:groups)).to eq groups
      # end

    end

    context 'When user dont log-in' do

    end
  end

end
