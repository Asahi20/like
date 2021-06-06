class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.includes(:user).order(:created_at)
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.create!(post_params)
    redirect_to post
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post.update!(post_params)
    redirect_to @post
  end

  def update
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = current_user.posts.find(porams[:id])
  end

end
