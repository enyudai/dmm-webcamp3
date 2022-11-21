class BooksController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end
  
  def create
    book=Book.new(book_params)
    book.user_id = current_user.id #カラムに情報を代入
    book.save
    redirect_to book_path(current_user.id)
  end
  
  def edit
  end
  
  def show
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end