class Team < ActiveRecord::Base
  #associations
  belongs_to :league
  has_many :players, through: :rosters

  #validations
  validates :league, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
