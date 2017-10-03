class GroupsController < ApplicationController
  def index
    @groups = current_user.groups.desc
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: "グループを作成しました。"
    else
      flash[:alert]="グループ作成に失敗しました。"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(params[:id]), notice: "グループを更新しました。"
    else
      flash[:alert] = "グループ作成に失敗しました"
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
