class PostsController < ApplicationController
  before_action :authorize!

  def index
    return @posts = [] unless current_user

    @posts = Post
      .from_followeds(current_user)
      .includes(:user)
      .includes(image_attachment: :blob)
      .includes(:likes)
      .order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :image).merge(user: current_user)
  end
end
