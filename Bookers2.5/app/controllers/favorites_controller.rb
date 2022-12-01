class FavoritesController < ApplicationController
  
  def create
    book = Book.find(params[:id])
    favorite = current_user.favorites.new(book: book.id)
    favorite.save
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    favorite = current_user.favorites.find_by(book: book.id)
    favorite.destroy
    redirect_to book_path(book)
  end
  
end
