class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :message, presence: true, length: { minimum: 5, maximum: 1000 }
  validates :user_id, :post_id, presence: true
end
