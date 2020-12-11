class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user.id)
    end

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      count = 0
      if @user.name.length < 2
        flash[:name_error] = "Name is too short (minimum is 2 characters)"
        count = count + 1
      end
      if @user.name.length > 20
        flash[:name_error] = "Name is too long (maximum is 20 characters)"
        count = count + 1
      end
      if @user.introduction.length > 50
        flash[:introduction_error] = "Introduction is too long (maximum is 50 characters)"
        count = count + 1
      end
      flash[:alert] = "#{count} errors prohibited this obj from being saved:"
      redirect_to edit_user_path(@user.id)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
