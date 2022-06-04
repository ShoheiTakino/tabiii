class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.new(comment_params)
    if comment.save
      #@post = Post.find(params[:post_id])
      render json:{ post: comment}
      #redirect_to post_path(@post)#ここをjsonにかる
    else 
      redirect_to post_path(comment)
    end
  end

  def destroy
  end

  private 
  def comment_params
    params.require(:comment).permit(:chat).merge(user_id: current_user.id)
  end
end
