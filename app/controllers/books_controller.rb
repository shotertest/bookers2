class BooksController < ApplicationController
  
  before_action :correct_book, only: [:edit ]

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
    
    if @book.user == current_user
      
    render "edit"
    
    else
      
    redirect_to books_path
      
    end


  end

  def create

    @book = Book.new(book_params)

    @book.user_id = current_user.id

    if @book.save

    flash[:notice] = "You have created book successfully."

    redirect_to book_path(@book.id)

    else

    render :index

    end

  end

 def update

    @book = Book.find(params[:id])

    if @book.update(book_params)

    flash[:notice] = "You have updated book successfully."

    redirect_to book_path(@book.id)
    
    else
    
    render :edit

    end

 end

 def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得

    book.destroy  # データ（レコード）を削除

    redirect_to books_path
 end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_book
    @book = Book.find(params[:id])
    @user = @book.user
  end

end
