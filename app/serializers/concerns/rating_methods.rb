module Concerns
  module RatingMethods
    def average_rating
      UserRating.average_rating(object.user_id)
    end
  end
end
