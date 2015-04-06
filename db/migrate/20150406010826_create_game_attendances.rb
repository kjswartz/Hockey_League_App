class CreateGameAttendances < ActiveRecord::Migration
  def change
    create_table :game_attendances do |t|
      t.references :user, index: true
      t.references :game, index: true

      t.timestamps null: false
    end
    add_foreign_key :game_attendances, :users
    add_foreign_key :game_attendances, :games
  end
end
