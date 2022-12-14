class GroupsController < ApplicationController
  before_action :specified_user, only: [:edit, :create_mail]
  
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
    @group.users << current_user
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
  
  def join
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to  groups_path
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.users.delete(current_user)
    redirect_to groups_path
  end
  
  def new_mail
    @group = Group.find(params[:group_id])
  end
  
   def send_mail
    @group = Group.find(params[:group_id])
    group_users = @group.users
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]
    ContactMailer.send_mail(@mail_title, @mail_content,group_users).deliver
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
