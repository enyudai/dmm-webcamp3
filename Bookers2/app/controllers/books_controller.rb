class BooksController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
  end
  
  def create
    book=Book.new(book_params)
    book.save
    redirect_to book_path(current_user.id)
  end
  
  def edit
  end
  
  def show
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body,)
  end
  
end