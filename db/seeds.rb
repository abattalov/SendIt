Scorecard.destroy_all
User.destroy_all

10.times do 
    User.create(name: Faker::Name.first_name,
    username: Faker::JapaneseMedia::DragonBall.character,
    password: "password")
end

10.times do
    Scorecard.create(course_name: Faker::Movies::HarryPotter.location,
    strokes: Faker::Number.between(from: 1, to: 40),
    score: Faker::Number.between(from: 1, to: 10),
    date: Faker::Date.backward(days: 365),
    user_id: User.ids.sample)
end

puts "seeds planted baybay!!!"