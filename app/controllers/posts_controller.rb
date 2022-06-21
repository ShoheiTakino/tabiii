class PostsController < ApplicationController
  before_action :search_category, only: [:index, :category]
  before_action :set_post, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :category]

  def index
    @user = User.all
    @posts = Post.all
  end

  def new
    @post = Post.new
    @user = Post.all
    redirect_to root_path unless current_user.id != @post.user_id
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
    @user = @post
    @comments = @post.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    @user = @post
    if current_user.id == @post.user.id
    else
      redirect_to root_path
    end
  end

  def update
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
    params.require(:post).permit(:title, :image, :content, :province_id, :address).merge(user_id: current_user.id)
  end

  def search_category
    @q = Post.ransack(params[:q])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to new_user_registration_path unless user_signed_in?
  end
end
