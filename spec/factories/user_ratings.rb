FactoryBot.define do
  factory :user_rating do
    rating { Faker::Number.between(from: 1, to: 5) }
    user_id { create(:user).id }
    rater_id { create(:user).id }
  end
end
