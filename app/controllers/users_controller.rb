class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def create


  end
  def index
    @user = current_user
    @book = Book.new
  end

  private


end
