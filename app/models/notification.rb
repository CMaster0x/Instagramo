class Notification < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, polymorphic: true

  validates :action, presence: true
end
