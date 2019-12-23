class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
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
    params.require(:post).permit(:title, :category, :image, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
