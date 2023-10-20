puts '--------- Creating 100 users...---------'

100.times do
  User.create(
    name: Faker::Name.name,
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

puts "Generated #{User.count} users"
