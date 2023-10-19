class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :updated_at
  belongs_to :user

  link :self do
    api_v1_post_path(object)
  end
end