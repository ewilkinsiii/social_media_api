puts '--------- Creating 100 users...---------'

100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

puts "Generated #{User.count} users"
