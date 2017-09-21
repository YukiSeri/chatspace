class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(create_params)
    redirect_to root_path
  end

  def edit
    @group = Group.find(1)
  end

  private

  def create_params
    params.require(:group).permit(:name)
  end
end
