class RemoveColumnTiesFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :tie, :integer
  end
end
