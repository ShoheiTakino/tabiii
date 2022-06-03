class UsersController < ApplicationController

  def show
    @user = User.all
    @post = Post.all
  end

  def edit
    @user = User.all
    user = User.new
    current_user.id == @user
    #if current_user.id == @user
    #else
      #redirect_to root_path
    #end
  end

  def update
    @user = User.find(params[:id])
    if user.update(user_params)
      redirect_to action: :show
    else
      @user = user
      render :edit
    end
  end



  private 
  def user_params
    params.require(:user).permit(:nickname, :email, :password).merge(:user, current_user.id)
  end
end
