ActiveAdmin.register Game do

  permit_params(:time, :home_goals, :away_goals, :league_id, :home_team_id, :away_team_id, :winner_id, :loser_id)

  index do
    selectable_column
    column :id
    column :time
    column :home_team
    column :away_team
    column :home_goals
    column :away_goals
    actions
  end

end
