class CommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = book.id
    if @comment.save
      flash[:notice] = "You have posted comment successfully."
      redirect_to book_path(book)
    else
      @show_book = Book.find(params[:book_id])
      @book = Book.new
      render template: "books/show"
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
