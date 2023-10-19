class UserRatingSerializer < ActiveModel::Serializer
  attributes :id, :rating, :user_id, :rater_id, :created_at, :updated_at
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', as: :user

  link :self do
    api_v1_user_rating_path(object)
  end
end
