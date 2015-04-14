User.destroy_all
Game.destroy_all

@teams = Team.all
@teams.each do |team|
  10.times do |counter|
    User.create!(name: Faker::Name.name,
                 email: Faker::Internet.safe_email,
                 remote_avatar_url: "http://2.cdn.nhle.com/photos/mugs/#{rand(8471200..8471331)}.jpg"
                 bio: Faker::Lorem.paragraph,
                 team_ids: team.id,
                 phone: Faker::PhoneNumber.cell_phone,
                 password: 'pa$$m0rd')
  end
end

#seeding team owners
  @teams = Team.where(owner: '')
  @teams.each do |team|
    @users = User.where(team_ids: team.id)
      @user_email = []
      @users.each do |user|
        @user_email << user.email
      end
    team.owner = @user_email.sample
    team.save
  end


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
                    time: "2015-#{rand(3..5)}-#{rand(3..30)} #{rand(18..23)}:#{@gt.sample}:00")
        @ht.games << @game
        @at.games << @game
      end
    end

# seeding game data
  @games = Game.where("time < ?", Date.today)
  @games.each do |game|
    teamids = []
    teamids << game.home_team_id
    teamids << game.away_team_id
    game.winner_id = teamids.sample
    otherid = teamids - [game.winner_id]
    game.loser_id = otherid.first
    if game.winner_id == game.home_team_id
      game.home_goals = rand(3..6)
      game.home_points = 2
      game.away_goals = rand(0..2)
      game.away_points = 1
    else
      game.home_goals = rand(0..2)
      game.home_points = 1
      game.away_goals = rand(3..6)
      game.away_points = 2
    end
    game.save
  end

#seeding user stats
  @users = User.all
  @users.each do |user|
    user.rosters.each do |roster|
      roster.goals = rand(0..11)
      roster.assists = rand(0..10)
      roster.penalties = rand(0..8)
      roster.games_played = rand(3..12)
      roster.save
    end
  end
