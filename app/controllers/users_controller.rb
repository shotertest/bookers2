class UsersController < ApplicationController
  
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
    
    end

  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  
end
