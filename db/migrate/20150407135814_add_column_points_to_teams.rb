class AddColumnPointsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :points, :integer, default: '0'
    change_column_default :teams, :win, 0
    change_column_default :teams, :lose, 0
  end
end
