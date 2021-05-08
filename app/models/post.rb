class Post < ApplicationRecord
  include PgSearch::Model
  pg_search_scope(:search_title, against: :title)
  
  belongs_to :user
  has_one_attached :image
  has_many :likes, as: :likeable
  has_many :notifications, as: :recipient
  validates :title, presence: true

  scope :from_followeds, ->(user){
    joins("LEFT JOIN followers ON followers.followed_id = posts.user_id")
      .where( followers: {follower_id: user})
      .or(where(user_id: user))
      .group(:id)
  }

  def square_image
    height = image.metadata[:height].to_i
    width = image.metadata[:width].to_i
    size = height > width ? width :height
    image.variant(gravity: 'center', extent: "#{size}x #{size}", resize_to_limit: [500, 500] )
  end
end
