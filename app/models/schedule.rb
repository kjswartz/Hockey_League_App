# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  game_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Schedule < ActiveRecord::Base
  belongs_to :team
  belongs_to :game
end
