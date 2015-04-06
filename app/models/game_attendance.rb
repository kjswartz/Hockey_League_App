# == Schema Information
#
# Table name: game_attendances
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  game_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GameAttendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :team

  validates :user_id, presence: true
  validates :game_id, presence: true
  validates :team_id, presence: true
end
