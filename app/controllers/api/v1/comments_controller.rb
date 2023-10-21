module Api
  module V1
    class CommentsController < Api::V1::ApiController
      before_action :set_post, only: %i[index]
      before_action :set_comment, only: %i[show update destroy]

      def index
        @comments = @post.comments.page(params[:page]).per(params[:per_page])
        render json: @comments, meta: pagination_dict(@comments), each_serializer: CommentSerializer, include: :user
      end

      def show
        render json: @comment, include: %i[post user]
      end

      def create
        @comment = Comment.new(comment_params)

        if @comment.save
          render json: @comment, status: :created
          UserTimelineJob.perform_now(
            @comment.user_id,
            'Post Comment',
            "Posted a comment on #{@comment.post.title}"
          )
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def update
        if @comment.update(comment_params)
          render json: @comment, status: :ok
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        title = @comment.post.title
        user_id = @comment.user_id

        @comment.destroy

        UserTimelineJob.perform_now(
          user_id,
          'Deleted Comment',
          "Deleted comment on the post #{title}"
        )
      end

      private

      def set_post
        @post = Post.find(params[:post_id])
      end

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:message, :post_id, :user_id)
      end
    end
  end
end
