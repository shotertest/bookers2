class BooksController < ApplicationController

  def index
    @book = Book.new

    @books = Book.all

    @user = current_user
  end

  def show
    @user = current_user

    @book = Book.find(params[:id])

  end

  def edit
  end

  def create
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
