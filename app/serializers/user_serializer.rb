class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :first_name, :last_name, :avatar, :average_rating
  has_many :posts

  def average_rating
    UserRating.average_rating(object.id)
  end
end
