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
  scope :current, -> { where("stop_date > ?", 1.day.ago) }

  # Associations
  belongs_to :team
  belongs_to :user

  #validations
  validates :start_date, presence: true
  validates :stop_date, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :team_id, presence: true
  validate :stop_date_cannot_be_before_start_date

  #methods
  def stop_date_cannot_be_before_start_date
    errors.add(:stop_date, "cannot be before start date") if stop_date < start_date
  end

  def user_event?(event, current_user)
    event.user == current_user
  end

end
