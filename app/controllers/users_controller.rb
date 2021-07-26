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

    if @user.update(list_params)
    redirect_to user_path(@user)
    flash[:notice] = 'ユーザープロフィールが更新されました'
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
