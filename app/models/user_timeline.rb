class UserTimeline < ApplicationRecord
  belongs_to :user
  validates :user_id, :action, :description, presence: true
end
