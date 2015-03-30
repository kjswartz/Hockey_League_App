# == Schema Information
#
# Table name: rosters
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RosterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
