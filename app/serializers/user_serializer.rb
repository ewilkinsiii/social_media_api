class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :name, :avatar, :average_rating
  has_many :posts
  has_many :user_ratings

  def average_rating
    UserRating.average_rating(object.id)
  end
end
