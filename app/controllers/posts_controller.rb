class PostsController < ApplicationController
before_action :search_category, only: [:index, :category]

  def index
    @user = User.all
    @posts = Post.all
  end

  def new
    @post = Post.new
    @user = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post
    @comment = Comment.find(params[:id])
    @comment = Comment.new
  end
  
  def edit
    @post = Post.find(params[:id])
    @user = @post
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      @user = Post.all
      @comment = Comment.new
      render :show
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if current_user.id == post.user.id
      post.destroy
      redirect_to root_path
    end
  end

  def category
    @posts = @q.result
    province_id = params[:q][:province_id_eq]
    @province = Province.find_by(id: province_id)
    @province_num = @posts.count
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :content, :province_id).merge(user_id: current_user.id)
  end

  def cooment_params
    params.require(:comment).permit(:chat).merge(post_id: current_user.id)
  end

  def search_category
    @q = Post.ransack(params[:q])
  end

end
