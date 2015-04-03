class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :game_time
      t.references :opponent, index: true
      t.references :team, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :teams
  end
end
