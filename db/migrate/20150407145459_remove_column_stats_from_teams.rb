class RemoveColumnStatsFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :win, :integer
    remove_column :teams, :lose, :integer
    remove_column :teams, :points, :integer
  end
end
