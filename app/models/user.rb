class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :password, presence: true 

  has_secure_password
  
  has_many :followers, foreign_key: :followed_id
  has_many :followeds, class_name: 'Follower', foreign_key: :follower_id
  has_many :posts
  has_many :notifications, as: :recipient

  def follows?(user)
    user_id = user.is_a?(User) ? user.id : user
    return true if  user_id == id
    followeds.where(followed_id: user_id).any?
  end

  def liked?(likeable)
    likeable.likes.where(user_id: id).any?
  end
end
