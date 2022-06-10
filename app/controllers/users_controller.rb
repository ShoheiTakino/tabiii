class UsersController < ApplicationController

  def show
    @user = User.all
    @users = User.find(params[:id])
    @sns = @users.sns_credentials
    @post = @users.posts
    #@following_users = @users.following_user
    #@follower_users = @users.follower_user
  end

  def edit
    @user = User.all
    user = User.new
    current_user.id == @user.id
    #if current_user.id == @user
    #else
      #redirect_to root_path
    #end
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
    user = User.find(paramas[:id])
    @users = user.following_user.page(params[:page]).per(3).reverse_order
  end

  def followers
    user = User.find(params[:id])
    @user = user.follower_user.page(params[:page]).per(3).reverse_order
  end


  private 
  def user_params
    params.permit(:nickname, :email, :password, :profile, :profile_image).merge(user: current_user.id)
  end
end
