ActiveAdmin.register Roster do

  permit_params(:team_id, :user_id, :goals, :assists, :penalties, :games_played, :role)

  index do
    selectable_column
    column :id
    column "Team Name" do |roster|
      roster.team.name
    end
    column "User Name" do |roster|
      roster.user.name
    end
    column :goals
    column :assists
    column :penalties
    column :games_played
    column "Points" do |roster|
      roster.goals + roster.assists
    end
    column :role
    actions
  end


end
