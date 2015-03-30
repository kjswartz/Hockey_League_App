# == Schema Information
#
# Table name: players
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  avatar          :string
#  phone           :string
#  bio             :text
#  role            :string
#  active          :boolean          default("true")
#  admin           :boolean          default("false")
#  goals           :integer
#  assists         :integer
#  penalties       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Player < ActiveRecord::Base
  #associations
  has_many :teams, through: :rosters

  #validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  mount_uploader :avatar, AvatarUploader

end
