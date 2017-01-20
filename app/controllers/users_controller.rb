class UsersController < ApplicationController
  before_action :check_if_logged_in, :only => [:edit, :update]
  before_action :check_if_admin, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user_id
      redirect_to users_main_path
    else
      render :new
    end
  end

  def edit
    @user= @current_user
  end

  def update
    user= @current_user
    user.update user_params
    redirect_to users_profile_path
  end

  def main
  end

  def profile
    @user= @current_user
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :image, :location)
  end

end
