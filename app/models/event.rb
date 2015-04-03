# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  game_time   :datetime
#  opponent_id :integer
#  team_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  belongs_to :opponent, class: Team
  belongs_to :team
end
