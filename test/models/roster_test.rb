# == Schema Information
#
# Table name: rosters
#
#  id           :integer          not null, primary key
#  team_id      :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  goals        :integer          default("0")
#  assists      :integer          default("0")
#  penalties    :integer          default("0")
#  games_played :integer          default("0")
#  role         :string
#

require 'test_helper'

class RosterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
