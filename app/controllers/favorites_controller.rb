class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.Favorites.new(post_id: post.id)
    favorite.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.Favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to post_path(post)
  end
end
