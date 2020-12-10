class BooksController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    
    @books = Book.all
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to user_path(current_user.id) #リダイレクト先は最終的には投稿したbookのshow#
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def destroy
  end

  def show
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
