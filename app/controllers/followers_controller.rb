class FollowersController <  ApplicationController
  def update
    if !current_user.follows?(user_id)
      Follower.create(follower: current_user, followed_id: user_id)
    end
    redirect_to user_path(user_id)
  end

  def destroy
    follower = Follower.find_by(follower: current_user, followed_id: user_id)
    follower&.destroy
    redirect_to user_path(user_id)
  end

  private

  def user_id
    @user_id ||= params[:id]
  end
end
