# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :boolean          default("true")
#  owner      :string
#  league_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base
  #associations
  belongs_to :league
  has_many :players, through: :rosters

  #validations
  validates :league, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
