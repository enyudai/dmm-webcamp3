class UsersController < ApplicationController
  
  def index
  end
  
  def show
    @user = User.find(params[:id])
    @book_images = @user.book_images
  end

  def edit
  end
end
