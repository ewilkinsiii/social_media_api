FactoryBot.define do
  factory :comment do
    message { Faker::Lorem.paragraph(sentence_count: 2) }
    user { create(:user) }
    post { create(:post) }
  end
end
