class AddGamesPlayedUsers < ActiveRecord::Migration
  def change
    add_column :users, :games_played, :integer
  end
end
