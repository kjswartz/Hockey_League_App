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

  def total_goals(user)
    user_goals = Roster.where(user: user).collect {|u| u.goals }.reduce :+
    return user_goals
  end

  def total_assists(user)
    user_assists = Roster.where(user: user).collect {|u| u.assists }.reduce :+
    return user_assists
  end

  def total_pims(user)
    user_penalties = Roster.where(user: user).collect {|u| u.penalties }.reduce :+
    return user_penalties
  end

end
