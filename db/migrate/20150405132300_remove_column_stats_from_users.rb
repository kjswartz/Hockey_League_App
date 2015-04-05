class RemoveColumnStatsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :goals, :integer
    remove_column :users, :assists, :integer
    remove_column :users, :penalties, :integer
    remove_column :users, :games_played, :integer
    remove_column :users, :role, :string
  end
end
