# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :boolean          default("false")
#  owner      :string
#  league_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  win        :integer
#  lose       :integer
#  tie        :integer
#

class Team < ActiveRecord::Base
  #associations
  belongs_to :league
  has_many :users, through: :rosters
  has_many :rosters, dependent: :destroy
  has_many :events
  # has_many :opponents, through: :events

  #validations
  validates :league, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
