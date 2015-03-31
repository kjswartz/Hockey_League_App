ActiveAdmin.register Team do

  permit_params(:name, :active, :owner, :league_id)

  form do |f|
    inputs '' do
      input :league, collection: League.all.collect { |l| [l.skill, l.id] }
      input :name
      input :owner
      input :active
    end
    actions
  end

  index do
    selectable_column
    column :id
    column :league do |team|
      team.league.skill
    end
    column :name
    column :owner
    column :active
    actions
  end

end
