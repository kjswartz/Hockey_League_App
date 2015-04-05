class AddStatsColumnToRosters < ActiveRecord::Migration
  def change
    add_column :rosters, :goals, :integer, default: '0'
    add_column :rosters, :assists, :integer, default: '0'
    add_column :rosters, :penalties, :integer, default: '0'
    add_column :rosters, :games_played, :integer, default: '0'
    add_column :rosters, :role, :string
  end
end
