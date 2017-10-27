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

      context 'with valid attributes' do
        subject { post :create, params: { message: attributes_for(:message), group_id: group } }

        it "save the new message in DB" do
          expect{subject}.to change(Message, :count).by(1)
        end

        it "redirects to group_messages_path" do
          subject
          expect(response).to redirect_to group_messages_path
        end

      end

      context 'with invalid attributes' do
        subject { post :create, params: { message: attributes_for(:message, text: nil, image: nil), group_id: group } }

        it "cannot save the new message in DB" do
          expect{subject}.to change(Message, :count).by(0)
        end

        it "renders the messages#index" do
          subject
          expect(response).to render_template :index
        end

        it "displays a flash error message" do
          subject
          expect(flash.now[:alert]).to eq("メッセージの送信に失敗しました。")
        end

      end

    end

  end

  context 'When user dont log-in' do
    describe 'GET #index' do
      it 'redirects to new_user_session_path' do
        get :index, params: { group_id: group }
        expect(response).to redirect_to new_user_session_path
      end
    end

  end

end
