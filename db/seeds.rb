@teams = Team.all
i = 0
@teams.each do |team|
  puts "#{team.name} being seeded"
  puts "Team Ccount #{i}"
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
  end
  i += 1
end

#seeding team owners
# @users = User.all
# @user_email = []
#
# @users.each do |user|
#   @user_email << user.email
# end
#
# @teams = Team.where(owner: '')
# @teams.each do |team|
#   team.owner = @user_email[rand(1..60)]
#   team.save
# end
