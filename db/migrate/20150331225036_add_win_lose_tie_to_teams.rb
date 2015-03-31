class AddWinLoseTieToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :win, :integer
    add_column :teams, :lose, :integer
    add_column :teams, :tie, :integer
  end
end
