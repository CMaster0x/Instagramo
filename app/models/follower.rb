class Follower < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  after_create :send_notification
  
  private

  def send_notification
    notification = Notification.create(recipient: followed, sender: follower , action: :follow)
    NotificationMailer.with(notification: notification).follower_email.deliver_later
  end
end
