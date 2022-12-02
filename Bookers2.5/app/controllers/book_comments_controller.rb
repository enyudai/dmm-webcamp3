class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.new(comment_params)
    @comment.user_id = current_user.id
    if  @comment.save
      redirect_to request.referer
    else
      @book_new = Book.new
      @comments = @book.comments
      redirect_to new_book_path
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
