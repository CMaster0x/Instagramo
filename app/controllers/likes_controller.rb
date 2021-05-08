class LikesController < ApplicationController
  def create
    Like.where(likeable_params).first_or_create
    redirect_to root_path
  end

  def destroy
    like = Like.find_by(id: params[:id])
    like&.destroy
    redirect_to root_path
  end

  private

  def likeable_params
    params.require(:like).permit(:likeable_id, :likeable_type).merge(user: current_user)
  end
end
