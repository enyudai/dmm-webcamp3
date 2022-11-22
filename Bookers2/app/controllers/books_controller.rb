class BooksController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]
  
  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end
  
  def create
    book=Book.new(book_params)
    book.user_id = current_user.id #カラムに情報を代入
    book.save
    redirect_to book_path(book.id)
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update
    redirect_to book_path(book.id)
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end