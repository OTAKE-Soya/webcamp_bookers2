class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(current_user.id) #リダイレクト先は最終的には投稿したbookのshow#
  end
  def index
    @user = current_user
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
