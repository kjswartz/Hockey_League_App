class ChangeColumnDefaultInTeams < ActiveRecord::Migration
  def change
    change_column_default :teams, :active, false
  end
end
