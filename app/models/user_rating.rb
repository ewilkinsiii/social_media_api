class UserRating < ApplicationRecord
  belongs_to :user
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', dependent: :destroy

  validates :rating, presence: true,
                     numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :user_id, :rater_id, presence: true
  validate :user_and_rater_are_not_the_same
  validates_uniqueness_of :user_id, scope: :rater_id, message: 'A record already exists from the rater to this user'

  def self.average_rating(user_id)
    where(user_id: user_id).average(:rating).to_i
  end

  def user_and_rater_are_not_the_same
    return unless user_id == rater_id

    errors.add(:user_id, "User's cannot rate themselves")
  end
end
