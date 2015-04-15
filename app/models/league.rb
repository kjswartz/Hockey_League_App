# == Schema Information
#
# Table name: leagues
#
#  id          :integer          not null, primary key
#  skill       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class League < ActiveRecord::Base
  #associations
  has_many :teams
  has_many :games

  #validators
  validates :skill, presence: true, uniqueness: { case_sensitive: false }

  #scopes
  scope :league_weekly_games, lambda { where("time between ? and ?", 1.day.ago, 6.days.from_now).order('time asc')}

  #methods
  def league_avg_goals
    league_total_goals = self.teams.collect {|teams| teams.total_goals}.reduce :+
    league_avg = league_total_goals / self.teams.count.to_f
    return league_avg.round(2)
  end

  def league_avg_wins
    league_total_wins = self.teams.collect {|teams| teams.winner_games}.reduce :+
    league_avg = league_total_wins / self.teams.count.to_f
    return league_avg.round(2)
  end

  def league_avg_losses
    league_total_losses = self.teams.collect {|teams| teams.loser_games}.reduce :+
    league_avg = league_total_losses / self.teams.count.to_f
    return league_avg.round(2)
  end

  def league_avg_points
    league_total_points = self.teams.collect {|teams| teams.game_points}.reduce :+
    league_avg = league_total_points / self.teams.count.to_f
    return league_avg.round(2)
  end

  def league_avg_penalties
    league_total_penalties = self.teams.collect {|teams| teams.team_penalties}.reduce :+
    league_avg = league_total_penalties / self.teams.count.to_f
    return league_avg.round(2)
  end

  def league_avg_ga
    league_total_ga = self.teams.collect {|teams| teams.goals_against}.reduce :+
    league_avg = league_total_ga / self.teams.count.to_f
    return league_avg.round(2)
  end

end
