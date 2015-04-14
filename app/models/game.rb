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
  scope :prior_games, -> { where("time < ?", Date.today) }
  scope :current_games, -> { where("time > ?", Date.today) }
  scope :weekly_games, lambda { where("time between ? and ?", Date.today, 1.week.from_now).order('time asc')}
  scope :today_games, lambda { where("time between ? and ?", Date.yesterday, Date.tomorrow) }

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
  validates :home_goals, numericality: {greater_than_or_equal_to: 0 }
  validates :away_goals, numericality: {greater_than_or_equal_to: 0 }
  validates :home_points, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }
  validates :away_points, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }
  validate :winner_and_loser_validation

  # Methods
  def winner_and_loser_validation
    if self.winner.present? && self.loser.present? && self.winner == self.loser
      errors.add(:loser_id, "can't be the same as Winner")
    end
  end

  def attending?(user, team)
    game_attendances.find_by(user: user, team: team)
  end

  def attending_members(team)
    result = team_attendance(team).collect{|ga| ga.user.name}
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
