class UsersController < ApplicationController
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  def create
    book=Book.new(book_params)
    book.user_id = current_user.id #カラムに情報を代入
    book.save
    redirect_to book_path(current_user.id)
  end
  
  def show
    @user=User.find(params[:id])
   @books = @user.books
  end

  def edit
  end
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  
end
