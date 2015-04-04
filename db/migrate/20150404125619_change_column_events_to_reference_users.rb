class ChangeColumnEventsToReferenceUsers < ActiveRecord::Migration
  def change
    rename_column :events, :game_time, :start_date
    add_column :events, :stop_date, :datetime
    add_reference :events, :user, index: true
    add_foreign_key :events, :users
    remove_column :events, :opponent_id
  end
end
