class NotificationMailer < ApplicationMailer
  
  def follower_email
    @notification = params[:notification]
    mail(to: @notification.recipient.email, subject: 'You have a new follower')
  end

  def like_email
    @notification = params[:notification]
    mail(to: @notification.recipient.user.email, subject: 'You have a new that gave a like to your awesome post')
  end
end
