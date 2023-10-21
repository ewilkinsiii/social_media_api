class UserTimeline < ApplicationRecord
  belongs_to :user
  validates :user_id, :action, :description, presence: true
  validates :user_id, numericality: { only_integer: true }
  validates :description, length: { minimum: 5, maximum: 1000 }
end
