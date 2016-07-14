5.times do
  user = User.create!(
    name: Faker::Name.name,
    handle: Faker::Internet.user_name,
    email:Faker::Internet.email)
  5.times do
    Tweet.create!(body: Faker::StarWars.quote, user_id: user.id)
  end
end
