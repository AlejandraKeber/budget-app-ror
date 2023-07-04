class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create 
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to groups_path, notice: "Group created successfully"
    else
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end