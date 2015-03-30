ActiveAdmin.register User do

  permit_params(:name, :email, :avatar, :avatar_cache, :bio, :remove_avatar)

  form do |f|
    inputs '' do
      input :name
      input :email
      input :avatar
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
    column :bio
    actions
  end

end
