@teams = Team.all

@teams.each do |team|
  puts "#{team.name} being seeded"
  x = 0
  10.times do |counter|
    puts "User count #{x}"
    User.create(name: Faker::Name.name,
               email: Faker::Internet.safe_email,
               remote_avatar_url: Faker::Avatar.image,
               bio: Faker::Lorem.paragraph,
               team_ids: team.id,
               phone: Faker::PhoneNumber.cell_phone,
               goals: rand(1..15),
               assists: rand(1..10),
               penalties: rand(1..20),
               password: 'password')
    x += 1
  end
end
