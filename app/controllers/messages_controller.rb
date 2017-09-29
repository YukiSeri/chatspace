class MessagesController < ApplicationController
  def index
    @message = Message.new
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.desc
  end

  def create
    @message = Message.new(message_params)
    binding.pry
    if @message.save
      redirect_to group_messages_path(params[:group_id])
    else
      flash[:alert]="メッセージを入力してください。"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
