class MessagesController < ApplicationController
  def index
    @message = Message.new
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.order("updated_at DESC")
  end

  def create

  end
end
