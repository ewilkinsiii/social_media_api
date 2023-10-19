FactoryBot.define do
  factory :comment do
    message { 'MyText' }
    user { nil }
    post { nil }
  end

  factory :invalid_comment, parent: :comment do |f|
    f.message { nil }
    f.user { nil }
    f.post { nil }
  end

  factory :comment_with_user_and_post, parent: :comment do |f|
    f.message { 'MyText' }
    f.user { create(:user) }
    f.post { create(:post) }
  end

  factory :comment_with_user, parent: :comment do |f|
    f.message { 'MyText' }
    f.user { create(:user) }
    f.post { nil }
  end

  factory :comment_with_post, parent: :comment do |f|
    f.message { 'MyText' }
    f.user { nil }
    f.post { create(:post) }
  end

  factory :comment_with_message, parent: :comment do |f|
    f.message { 'MyText' }
    f.user { nil }
    f.post { nil }
  end
end
