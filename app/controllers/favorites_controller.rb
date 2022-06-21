class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.Favorites.new(post_id: post.id)
    favorite.save
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.Favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to root_path
  end
end
