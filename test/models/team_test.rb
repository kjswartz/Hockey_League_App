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
#  win        :integer
#  lose       :integer
#  tie        :integer
#

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
