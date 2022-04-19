class UsersController < ApplicationController
  # before_action :authenticate_user!, except: [:show, :index]
  # before_action :signed_in_user, only: [:edit, :update]
  # before_action :corrent_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @bookindex = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have update user successfully.'
    else 
      render :edit
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  # def corrent_user
  #   @user = User.find(params[:id])
  #   redirect_to(user_path) unless @user == current_user　慣れたら使う、基本はif文からやっていく
  # end
end


