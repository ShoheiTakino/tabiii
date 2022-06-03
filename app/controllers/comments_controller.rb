class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      @post = Post.find(params[:post_id])
      redirect_to post_path(@post)
    else 
      redirect_to post_path(@post)
    end
  end

  private 
  def comment_params
    params.require(:comment).permit(:chat).merge(user_id: current_user.id)
  end
end
