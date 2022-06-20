class UsersController < ApplicationController
  before_action :set_item, only: [:show, :edit]
  before_action :set_follow, only: [:follows, :followers]

  def show
    @users = User.find(params[:id])
    @sns = @users.sns_credentials
    @post = @users.posts
    # @following_users = @users.following_user
    # @follower_users = @users.follower_user
  end

  def edit
    unless current_user.id == @user
      redirect_to root_path
    end
    user = User.new
    current_user.id == @user.id
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      @user = user
      render :edit
    end
  end

  def follows
    @users = user.following_user.page(params[:page]).per(3).reverse_order
  end

  def followers
    @user = user.follower_user.page(params[:page]).per(3).reverse_order
  end

  private

  def user_params
    params.permit(:nickname, :email, :password, :profile, :profile_image).merge(user: current_user.id)
  end

  def set_item
    @user = User.all
  end

  def set_follow
    user = User.find(params[:id])
  end 
end
