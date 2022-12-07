class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
  if @group.save
    redirect_to groups_path
  else
    render 'group_form'
  end
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def group_form
    @group = Group.new
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end

end
