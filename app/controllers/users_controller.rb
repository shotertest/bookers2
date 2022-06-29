class UsersController < ApplicationController
  
  before_action :authenticate_user!
  
  before_action :correct_user, only: [:edit, :update]


  def new
  end

  def index
    @book = Book.new

    @books = Book.all

    @user = current_user

    @users =User.all
  end

  def show
    @book = Book.new

    @user = current_user

    @user_find = User.find(params[:id])

    @books = @user_find.books


  end

  def edit

    @user = User.find(params[:id])

  end

  def update

    @user = User.find(params[:id])

    if @user.update(user_params)

    flash[:notice] = "You have updated user successfully."

    redirect_to user_path(@user.id)

    else

    render :edit

    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
