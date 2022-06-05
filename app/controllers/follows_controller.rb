class FollowsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to request.refer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.refer
  end
end
