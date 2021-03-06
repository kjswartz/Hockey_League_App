ActiveAdmin.register Team do

  permit_params(:name, :active, :owner, :league_id, :win, :lose, :tie, :opponent, :event, events: [])

  form do |f|
    inputs '' do
      input :league, collection: League.order("skill ASC").all.collect { |l| [l.skill, l.id] }
      input :name
      input :owner, collection: User.order("email ASC").all.collect { |u| [u.email, u.email] }
      # input :owner, collection: User.where(id: team.user_ids).order("email ASC").all.collect { |u| [u.email, u.email] }
      input :active
    end
    actions
  end

  index do
    selectable_column
    column :league do |team|
      link_to team.league.skill, admin_league_path(team.league.id)
    end
    column 'Team' do |team|
      link_to team.name, admin_team_path(team.id)
    end
    column :owner
    column 'Player Count' do |team|
      team.users.count
    end
    column :active
    actions
  end

  preserve_default_filters!
  # filter :league, collection: League.all.collect { |l| [l.skill, l.id] }

end
