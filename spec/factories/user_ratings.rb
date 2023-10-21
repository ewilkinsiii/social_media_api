FactoryBot.define do
  factory :user_rating do
    rating { Faker::Number.between(from: 1, to: 5) }
    user { create(:user) }
    rater_id { create(:user).id }
  end
end
