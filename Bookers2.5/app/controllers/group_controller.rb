class GroupController < ApplicationController
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
  if @group.save
    redirect_to groups_path(@group)
  else
    render 'group_form'
  end
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end
  
end
