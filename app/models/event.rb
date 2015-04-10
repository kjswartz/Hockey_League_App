# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  start_date  :datetime
#  team_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  stop_date   :datetime
#  user_id     :integer
#  description :string
#

class Event < ActiveRecord::Base
  #scopes
  scope :current, ->(time) { where("stop_date > ?", time) }

  # Associations
  belongs_to :team
  belongs_to :user

  validates :start_date, presence: true
  validates :stop_date, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :team_id, presence: true

end
