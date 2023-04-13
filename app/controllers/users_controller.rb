class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
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
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
  def correct_user
    @user = User.find(params[:id])
    @book = @user.book
    redirect_to(books_path) unless @book == current_user
  end
  
  #def ensure_user
    #@user = current_user.books
    #@book = @user.find_by(id: params[:id])
    #redirect_to (books_path) unless @book
  #end

end
