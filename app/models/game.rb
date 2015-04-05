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
#

class Game < ActiveRecord::Base
  # Associations
  belongs_to :league
  belongs_to :home_team, class: Team
  belongs_to :away_team, class: Team
  belongs_to :winner, class: Team
  belongs_to :loser, class: Team
  has_many :schedules, dependent: :destroy
  has_many :teams, through: :schedules

  # Validators
  validates :league_id, presence: true
  validates :home_team_id, presence: true
  validates :away_team_id, presence: true
  validates :time, presence: true

end
