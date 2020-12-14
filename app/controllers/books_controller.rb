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
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      # count = 0
      # if @book.title == ""
      #   flash[:title_error] = "Title can't be blank"
      #   count = count + 1
      # end
      # if @book.body == ""
      #   flash[:body_error] = "Body can't be blank"
      #   count = count + 1
      # end
      # if @book.body.length > 200
      #   flash[:body_error] = "Body is too long (maximum is 200 characters)"
      #   count = count + 1
      # end
      # flash[:alert] = "#{count} errors prohibited this obj from being saved:"
      # redirect_to books_path
      @user = current_user
      @books = Book.all
      render :index
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
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      count = 0
      if @book.title == ""
        flash[:title_error] = "Title can't be blank"
        count = count + 1
      end
      if @book.body == ""
        flash[:body_error] = "Body can't be blank"
        count = count + 1
      end
      if @book.body.length > 200
        flash[:body_error] = "Body is too long (maximum is 200 characters)"
        count = count + 1
      end
      flash[:alert] = "#{count} errors prohibited this obj from being saved:"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def show
    @show_book = Book.find(params[:id])
    @book = Book.new
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
