load 'db/seeds/users.rb'
load 'db/seeds/posts.rb'
load 'db/seeds/comments.rb'

AdminUser.create!(email: 'admin@example.com', password: 'password') if Rails.env.development?
