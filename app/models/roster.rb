# == Schema Information
#
# Table name: rosters
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Roster < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
end
