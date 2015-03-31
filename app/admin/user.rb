ActiveAdmin.register User do

  permit_params(:name, :email, :avatar, :avatar_cache, :bio, :remove_avatar, :active, :team_ids, team_ids: [])

  form do |f|
    inputs '' do
      input :name
      input :email
      input :avatar
      input :teams, :as => :check_boxes, :collection => Team.order("name ASC").all
      input :bio
    end
    actions
  end

  index do
    selectable_column
    column :id
    column "Profile Pic" do |user|
      image_tag user.avatar.url(:thumb)
    end
    column :name
    column :email
    column 'Leagues' do |user|
      user.teams.map { |t| link_to t.league.skill, admin_league_path(t.league.id) }.join("<br>").html_safe
    end
    column 'Teams' do |user|
      user.teams.map { |t| link_to t.name, admin_team_path(t.id) }.join("<br>").html_safe
    end
    column :active
    actions
  end

end
