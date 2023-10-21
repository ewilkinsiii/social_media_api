class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :user_id, presence: true
  validates :body, presence: true, length: { minimum: 5, maximum: 1000 }
end
