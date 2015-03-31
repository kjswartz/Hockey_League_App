ActiveAdmin.register League do

  permit_params(:skill, :description)

  form do |f|
    inputs '' do
      input :skill
      input :description
    end
    actions
  end

  index do
    selectable_column
    column :id
    column :skill
    column :description
    column 'Team Count' do |league|
      league.teams.count
    end
    actions
  end

end
