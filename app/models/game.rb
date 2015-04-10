# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  time         :datetime
#  home_team_id :integer
#  away_team_id :integer
#  winner_id    :integer
#  loser_id     :integer
#  home_goals   :integer          default("0")
#  away_goals   :integer          default("0")
#  league_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  home_points  :integer          default("0")
#  away_points  :integer          default("0")
#

class Game < ActiveRecord::Base
  #scopes
  scope :current, ->(time) { where("time > ?", time) }
  scope :weekly, ->(time) { where("time < ?", time) }
  scope :prior_games, ->(time) { where("time < ?", time) }

  # Associations
  belongs_to :league
  belongs_to :home_team, class: Team
  belongs_to :away_team, class: Team
  belongs_to :winner, class: Team
  belongs_to :loser, class: Team
  has_many :schedules, dependent: :destroy
  has_many :teams, through: :schedules, dependent: :destroy
  has_many :game_attendances, dependent: :destroy

  # Validators
  validates :league_id, presence: true
  validates :home_team_id, presence: true
  validates :away_team_id, presence: true
  validates :time, presence: true

  # Methods
  def attending?(user, team)
    game_attendances.find_by(user: user, team: team)
  end

  def attending_members(team)
    result = game_attendances.where(team: team).collect{|ga| ga.user.name}.join(", ")
    return result
  end

  def team_attendance(team)
    result = game_attendances.where(team: team)
    return result
  end

  def not_attending(team)
    result = (team.users.count) - (game_attendances.where(team: team).count)
    return result
  end


end
