class ExplorerController < ApplicationController
  def index
    @hashtag = "##{params[:hashtag]}"
    @posts = Post
      .search_title(@hashtag)
      .includes(:user)
      .includes(image_attachment: :blob)
      .includes(:likes)
      .order(created_at: :desc)
  end
end