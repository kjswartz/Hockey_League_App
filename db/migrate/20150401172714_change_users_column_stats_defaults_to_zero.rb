class ChangeUsersColumnStatsDefaultsToZero < ActiveRecord::Migration
  def change
    change_column_default :users, :goals, 0
    change_column_default :users, :assists, 0
    change_column_default :users, :penalties, 0
  end
end
