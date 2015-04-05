# == Schema Information
#
# Table name: leagues
#
#  id          :integer          not null, primary key
#  skill       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class League < ActiveRecord::Base
  #associations
  has_many :teams
  has_many :games

  validates :skill, presence: true, uniqueness: { case_sensitive: false }

end
