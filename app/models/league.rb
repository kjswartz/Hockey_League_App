class League < ActiveRecord::Base
  #associations
  has_many :teams
end
