class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :time
      t.references :home_team, index: true
      t.references :away_team, index: true
      t.references :winner, index: true
      t.references :loser, index: true
      t.integer :home_goals, default: '0'
      t.integer :away_goals, default: '0'
      t.references :league, index: true

      t.timestamps null: false
    end
    add_foreign_key :games, :leagues
  end
end
