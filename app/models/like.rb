class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  after_create :send_notification

  private

  def send_notification
    notification = Notification.create(recipient: likeable, sender: user, action: :like)
    NotificationMailer.with(notification: notification).like_email.deliver_later
  end
end
