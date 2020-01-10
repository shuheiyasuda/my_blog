class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]
  # before_action :authenticate_user!, expect: [:index]

  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    
  end

  def edit

  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :category, :image, :content).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
