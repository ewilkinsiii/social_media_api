module Api
  module V1
    class UserRatingsController < Api::V1::ApiController
      before_action :set_user_rating, only: %i[show update]

      def index
        @ratings = UserRating.page(params[:page]).per(params[:per_page])
        render json: @ratings, meta: pagination_dict(@ratings), each_serializer: UserRatingSerializer, include: :user
      end

      def show
        render json: @user_rating, include: %i[user rater]
      end

      def create
        @user_rating = UserRating.new(user_rating_params)

        if @user_rating.save
          render json: @user_rating, status: :created
        else
          render json: @user_rating.errors, status: :unprocessable_entity
        end
      end

      def update
        if @user_rating.update(user_rating_params)
          render json: @user_rating, status: :ok
        else
          render json: @user_rating.errors, status: :unprocessable_entity
        end
      end

      private

      def set_user_rating
        @user_rating = UserRating.find(params[:id])
      end

      def user_rating_params
        params.require(:user_rating).permit(:rating, :rater_id, :user_id)
      end
    end
  end
end
