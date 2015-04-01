@teams = Team.all
i = 59
@teams.each do |team|
  puts "#{team.name} being seeded"
  puts "Teams left #{i}"
  10.times do |counter|
    User.create(name: Faker::Name.name,
               email: Faker::Internet.safe_email,
               remote_avatar_url: Faker::Avatar.image,
               bio: Faker::Lorem.paragraph,
               team_ids: team.id,
               phone: Faker::PhoneNumber.cell_phone,
               goals: rand(1..15),
               assists: rand(1..10),
               penalties: rand(1..20),
               password: 'password',
               games_played: rand(1..11))
    i -= 1
  end
end
