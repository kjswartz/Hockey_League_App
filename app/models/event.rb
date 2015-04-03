class Event < ActiveRecord::Base
  belongs_to :opponent, class: Team
  belongs_to :team
end
