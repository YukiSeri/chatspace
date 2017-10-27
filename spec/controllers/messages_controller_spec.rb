require 'rails_helper'

describe MessagesController do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { create(:message) }

  context 'When user can log-in' do
    before do
      login_user(user)
    end

    describe 'GET #index' do

      it "renders the :index template" do
        get :index, params: { group_id: group }
        expect(response).to render_template :index
      end

      it "assigns the requested contact to @group" do
        t_group = group
        get :index, params: { group_id: t_group }
        expect(assigns(:group)).to eq t_group
      end

      it "assigns the requested contact to @groups" do
        t_group = user.groups.first
        get :index, params: { group_id: t_group }
        groups = user.groups
        expect(assigns(:groups)).to eq groups
      end

      it "assigns a new message as @message" do
        t_group = group
        get :index, params: { group_id: t_group }
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "assigns the requested message to @messages" do
        t_group = group
        get :index, params: { group_id: t_group }
        messages = create_list(:message, 3, user: user, group: t_group)
        expect(assigns(:messages)).to eq messages
      end

    end

    describe 'POST #create' do

      subject { post :create, params: { message: attributes_for(:message), group_id: group } }

      it "save the new message in DB" do
        expect{subject}.to change(Message, :count).by(1)
      end

      it "redirects to group_messages_path" do
        subject
        expect(response).to redirect_to group_messages_path
      end

    end

  end

  context 'When user dont log-in' do

  end

end
