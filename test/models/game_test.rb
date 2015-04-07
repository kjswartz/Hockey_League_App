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

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
