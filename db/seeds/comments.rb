puts '-------------- Creating comments...---------------'

posts = Post.all

posts.each do |post|
  num_comments = rand(2..6)

  users = User.all.sample(num_comments)

  num_comments.times do
    Comment.create(
      message: Faker::Lorem.sentence,
      user: users.pop,
      post: post
    )
  end
end

puts "Generated #{Comment.count} comments"
