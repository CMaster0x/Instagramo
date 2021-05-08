class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    .includes(:user)
    .includes(image_attachment: :blob)
    .order(created_at: :desc)
  end
end
