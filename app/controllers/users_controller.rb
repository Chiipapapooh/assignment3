class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @user = current_user
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user = current_user
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end 
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :book, :title, :body)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end 
end
  
