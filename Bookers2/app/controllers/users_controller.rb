class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  def create
    book=Book.new(book_params)
    book.user_id = current_user.id #カラムに情報を代入
   if book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(book.id)
   else
    render :books
   end
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
  if  @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(current_user.id)
  else
    render :edit
  end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  
end
