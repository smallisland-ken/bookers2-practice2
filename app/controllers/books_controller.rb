class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def show
    @user = current_user
    @book = Book.new
    @book = Book.find(params[:id])
    @bookdetail = @book.user
  end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.save(book_params)
    flash[:notice] = '本の情報が更新されました'
    redirect_to book_path(@book)
    else
    flash[:alert] = '本の情報の更新に失敗しました'
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
  params.require(:book).permit(:title, :body)
  # これが小文字の理由は？
  end
end
