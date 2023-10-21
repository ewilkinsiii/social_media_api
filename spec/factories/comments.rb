FactoryBot.define do
  factory :comment do
    message { Faker::Lorem.paragraph(sentence_count: 2) }
    user_id { create(:user).id }
    post_id { create(:post).id }
  end
end
