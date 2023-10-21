FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 10) }
    body { Faker::Lorem.paragraph(sentence_count: 1) }
    user { create(:user) }
  end
end
