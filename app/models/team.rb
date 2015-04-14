# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :boolean          default("false")
#  owner      :string
#  league_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base
  #scopes
  scope :active, ->{where(active: true)}


  #associations
  belongs_to :league
  has_many :users, through: :rosters
  has_many :rosters, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :games, through: :schedules
  has_many :game_attendances, dependent: :destroy


  #validations
  validates :league, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :owner, presence: true

  # Methods
  def total_goals
    ht_goals = games.where(home_team_id: self.id).collect {|ht| ht.home_goals}.reduce :+
    at_goals = games.where(away_team_id: self.id).collect {|at| at.away_goals}.reduce :+
    ht_goals = 0 if ht_goals.blank?
    at_goals = 0 if at_goals.blank?
    result = ht_goals + at_goals
    return result
  end

  def winner_games
    winner_games = games.where(winner_id: self.id).count
    winner_games = 0 if winner_games.blank?
    return winner_games
  end

  def loser_games
    loser_games = games.where(loser_id: self.id).count
    loser_games = 0 if loser_games.blank?
    return loser_games
  end

  def total_games_played
    result = winner_games + loser_games
    return result
  end

  def game_points
    ht_points = games.where(home_team_id: self.id).collect {|ht| ht.home_points}.reduce :+
    at_points = games.where(away_team_id: self.id).collect {|at| at.away_points}.reduce :+
    ht_points = 0 if ht_points.blank?
    at_points = 0 if at_points.blank?
    result = ht_points + at_points
    return result
  end

  def goals_against
    ht_goals_against = games.where(home_team_id: self.id).collect {|opponent| opponent.away_goals}.reduce :+
    at_goals_against = games.where(away_team_id: self.id).collect {|opponent| opponent.home_goals}.reduce :+
    ht_goals_against = 0 if ht_goals_against.blank?
    at_goals_against = 0 if at_goals_against.blank?
    result = ht_goals_against + at_goals_against
    return result
  end

  def team_penalties
    self.rosters.collect {|roster| roster.penalties}.reduce :+
  end

  def team_assists
    self.rosters.collect {|roster| roster.assists}.reduce :+
  end

  def team_avg_goals
    team_avg = self.total_goals / self.users.count.to_f
    return team_avg.round(2)
  end

  def team_avg_assists
    team_avg = self.team_assists / self.users.count.to_f
    return team_avg.round(2)
  end

  def team_avg_penalties
    team_avg = self.team_penalties / self.users.count.to_f
    return team_avg.round(2)
  end


end
