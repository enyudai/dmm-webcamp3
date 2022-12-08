class GroupsController < ApplicationController
  before_action :specified_user, only: [:edit]
  
  def show
    @group = Group.find(params[:id])
    @groups = Group.all
  end
  
  def index
    @groups = Group.all
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
  if @group.save
    redirect_to groups_path
  else
    render :group_form
  end
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
   if @group.update(group_params)
    redirect_to groups_path
   else
    render :edit
   end
  end
  
  def group_form
    @group = Group.new
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end

  def specified_user
    @group =  @group = Group.find(params[:id])
    redirect_to (groups_path) unless @group.owner_id == current_user.id
  end

end
