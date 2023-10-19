class PostSerializer < ActiveModel::Serializer
  include Concerns::RatingMethods
  attributes :id, :title, :body, :created_at, :updated_at, :average_rating
  belongs_to :user
  has_many :comments

  link :self do
    api_v1_post_path(object)
  end
end
