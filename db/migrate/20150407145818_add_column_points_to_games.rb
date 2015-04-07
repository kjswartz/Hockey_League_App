class AddColumnPointsToGames < ActiveRecord::Migration
  def change
    add_column :games, :home_points, :integer, default: '0'
    add_column :games, :away_points, :integer, default: '0'
  end
end
