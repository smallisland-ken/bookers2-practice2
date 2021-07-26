class BooksController < ApplicationController
  before_action :authenticate_user! 
 
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = '新規投稿に成功しました'
    redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end
  
  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    # @user = current_user
  end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    @bookuser = @book.user
    if @bookuser == current_user  
      render "edit"
    else
    redirect_to books_path  
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = '本の情報が更新されました'
    redirect_to book_path(@book)
    else
    flash[:alert] = '本の情報の更新に失敗しました'
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    flash[:alert] = '本の情報は削除されました'
    redirect_to books_path
    end
  end

  private

  def book_params
  params.require(:book).permit(:title, :body)
  # これが小文字の理由は？
  end
end
