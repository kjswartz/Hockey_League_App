# == Schema Information
#
# Table name: game_attendances
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  game_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GameAttendanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
