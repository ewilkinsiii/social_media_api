FactoryBot.define do
  factory :user_timeline do
    user { create(:user) }
    action { Faker::Lorem.word }
    description { Faker::Lorem.paragraph(sentence_count: 1) }
  end
end
