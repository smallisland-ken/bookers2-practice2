class UsersController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(list_params)
    redirect_to user_path(@user)
  end
  
  private
  
  def list_params
  params.require(:user).permit(:name, :introduction, :profile_image)  
  end
end
