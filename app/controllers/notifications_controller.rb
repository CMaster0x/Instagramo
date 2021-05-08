class NotificationsController < ApplicationController
  def index 
    @notifications = Notification
      .joins("LEFT JOIN posts ON notifications.recipient_id = posts.id")
      .where(recipient: current_user)
      .or(Notification
        .where(recipient_type: 'Post', posts: { user_id: current_user }))
      .order(created_at: :desc)
  end
end
