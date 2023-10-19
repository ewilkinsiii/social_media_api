puts '---------  Generating posts ----------'

users = User.all

users.each do |user|
  rand(1..5).times do
    user.posts.create(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph
    )
  end
end

puts "Generated #{Post.count} posts"
