class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :team, index: true
      t.references :game, index: true

      t.timestamps null: false
    end
    add_foreign_key :schedules, :teams
    add_foreign_key :schedules, :games
  end
end
