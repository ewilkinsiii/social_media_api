class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validate :message, presence: true, length: { minimum: 5, maximum: 1000 }
  validate :user_id, :post_id, presence: true
end
