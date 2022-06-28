class BooksController < ApplicationController

  def index

    @book = Book.new

    @books = Book.all

    @user = current_user
  end

  def show

    @user = current_user

    @book = Book.find(params[:id])

    @book_new = Book.new

  end

  def edit

    @book = Book.find(params[:id])

  end

  def create

    @book = Book.new(book_params)

    @book.user_id = current_user.id

    @book.save

    redirect_to book_path(@book.id)
  end

 def update

    @book = Book.find(params[:id])

    @book.update(book_params)

    redirect_to book_path(@book.id)
 end
 
 def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    
    book.destroy  # データ（レコード）を削除
    
    redirect_to book_path
 end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
