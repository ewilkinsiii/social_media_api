module Api
  module V1
    class PostsController < Api::V1::ApiController
      before_action :set_post, only: %i[show update destroy]

      def index
        @posts = Post.page(params[:page]).per(params[:per_page])
        render json: @posts, meta: pagination_dict(@posts), each_serializer: PostSerializer, include: :user
      end

      def show
        render json: @post, include: %i[user comments]
      end

      def create
        @post = Post.new(post_params)

        if @post.save
          render json: @post, status: :created
          UserTimelineJob.perform_now(
            @post.user_id,
            'Created Post',
            "Created the post #{@post.title}"
          )
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def update
        if @post.update(post_params)
          render json: @post, status: :ok
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @post.destroy
      end

      private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :body, :user_id)
      end
    end
  end
end
