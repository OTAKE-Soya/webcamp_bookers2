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
      redirect_to book_path(@book.id) #リダイレクト先は最終的には投稿したbookのshow#
    else
      redirect_to root_path
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
