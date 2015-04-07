# @teams = Team.all
# i = 0
# @teams.each do |team|
#   puts "#{team.name} being seeded"
#   puts "Team Ccount #{i}"
#   10.times do |counter|
#     User.create(name: Faker::Name.name,
#                email: Faker::Internet.safe_email,
#                remote_avatar_url: Faker::Avatar.image,
#                bio: Faker::Lorem.paragraph,
#                team_ids: team.id,
#                phone: Faker::PhoneNumber.cell_phone,
#                goals: rand(1..15),
#                assists: rand(1..10),
#                penalties: rand(1..20),
#                password: 'password',
#                games_played: rand(1..11))
#   end
#   i += 1
# end

# @ids = %w(561 557 544 536 528 524 518 517 511 491 488 485 482 478 472 469 468)
# @moreids = %w(428 427 425 424 403 393 391 389 383 365 360 357 350 345 334 332 324 322 315)
# @evenmoreids = %w(308 307 281 278 272 270 264 260 255 243 241 239 237 231 221 220 216 214)
# @idsids = %w(207 200 195 191 190 189 185 180 177 173 168 157 156 155 152 148 145 144 143 141)
# @idsidsids = %w(138 134 461 458 452 446 439 437 434)
#
# @ids.each do |id|
#   id.to_i
#   user = User.find_by(id: id)
#   user.remote_avatar_url = "http://2.cdn.nhle.com/photos/mugs/#{rand(8471200..8471330)}.jpg"
#   user.save
# end
#
# puts "1 of 5 done"
#
# @moreids.each do |id|
#   id.to_i
#   user = User.find_by(id: id)
#   user.remote_avatar_url = "http://2.cdn.nhle.com/photos/mugs/#{rand(8471200..8471330)}.jpg"
#   user.save
# end
#
# puts "2 of 5 done"
#
# @evenmoreids.each do |id|
#   id.to_i
#   user = User.find_by(id: id)
#   user.remote_avatar_url = "http://2.cdn.nhle.com/photos/mugs/#{rand(8471200..8471330)}.jpg"
#   user.save
# end
#
# puts "3 of 5 done"
#
# @idsids.each do |id|
#   id.to_i
#   user = User.find_by(id: id)
#   user.remote_avatar_url = "http://2.cdn.nhle.com/photos/mugs/#{rand(8471200..8471330)}.jpg"
#   user.save
# end
#
# puts "4 of 5 done"
#
# @idsidsids.each do |id|
#   id.to_i
#   user = User.find_by(id: id)
#   user.remote_avatar_url = "http://2.cdn.nhle.com/photos/mugs/#{rand(8471200..8471330)}.jpg"
#   user.save
# end

#
# @users.each do |user|
#   user.remote_avatar_url = "http://2.cdn.nhle.com/photos/mugs/#{rand(8471200..8471330)}.jpg"
#   user.save
# end

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
    #   team.owner = @user_email[rand(4..100)]
    #   team.save
    # end


#seeding game schedules
    @leagues = League.all
    @gt = [00, 15, 30, 45]
    @leagues.each do |league|
      10.times do |counter|
        ltids = league.team_ids
        ht = ltids.sample
        newltids = ltids - [ht]
        at = newltids.sample
        @ht = Team.find_by(id: ht)
        @at = Team.find_by(id: at)
        @game = Game.create!(league: league,
                    home_team_id: ht,
                    away_team_id: at,
                    time: "2015-#{rand(4..5)}-#{rand(3..30)} #{rand(18..23)}:#{@gt.sample}:00")
        @ht.games << @game
        @at.games << @game
      end
    end
