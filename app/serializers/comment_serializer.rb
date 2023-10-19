class CommentSerializer < ActiveModel::Serializer
  attributes :id, :message, :user_id, :post_id
  belongs_to :user
  belongs_to :post

  link :self do
    api_v1_post_comment_path(object.post, object)
  end
end
