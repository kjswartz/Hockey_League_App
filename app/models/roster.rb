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

class Roster < ActiveRecord::Base
  belongs_to :team
  belongs_to :user

  # Methods
  def game_points
    goals + assists
  end
  
end
