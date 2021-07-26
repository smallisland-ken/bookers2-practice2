class UsersController < ApplicationController
  before_action :authenticate_user! 
 
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
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(list_params)
    flash[:notice] = 'ユーザープロフィールが更新されました'  
    redirect_to user_path(@user)
    else
    flash.now[:alert] = 'ユーザープロフィールの更新に失敗しました'
    render :edit
    end
  end
  
  private
  
  def list_params
  params.require(:user).permit(:name, :introduction, :profile_image)  
  end
end
