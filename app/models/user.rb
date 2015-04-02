# == Schema Information
#
# Table name: users
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
#  goals           :integer          default("0")
#  assists         :integer          default("0")
#  penalties       :integer          default("0")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  games_played    :integer
#  deleted_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password

  #associations
  has_many :teams, through: :rosters
  has_many :rosters, dependent: :destroy

  #validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, on: :create

  mount_uploader :avatar, AvatarUploader

  # Methods
  def game_points
    goals + assists
  end

  def team_owner?(team)
    self.email == team.owner
  end

  def team_member?(team)
    team.users.find_by(id: self)
  end
end
