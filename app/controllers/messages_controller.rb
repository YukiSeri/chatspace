class MessagesController < ApplicationController

  before_action :group, only: [:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(params[:group_id])
    else
      flash.now[:alert]="メッセージの送信に失敗しました。"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def group
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.desc
  end
end
