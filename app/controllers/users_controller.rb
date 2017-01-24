class UsersController < ApplicationController
  before_action :check_if_logged_in, :only => [:edit, :update, :index]
  before_action :check_if_admin, :only => []

  def index
    @users = User.all

  end

  def show
    @user = User.find params[:id]
    if @user == @current_user
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
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

  def profile
    @user= @current_user
  end

  def following
    @title = "Following"
    @user = User.find params[:id]
    @users = @user.following.paginate(page: params[:page])
    render 'show_relationships'
  end

  def followers
    @title = "Followers"
    @user = User.find params[:id]
    @users = @user.followers.paginate(page: params[:page])
    render 'show_relationships'
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :image, :location)
  end

end
