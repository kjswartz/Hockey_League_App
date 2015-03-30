class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :active, :default => true
      t.string :owner
      t.references :league, index: true

      t.timestamps null: false
    end
    add_foreign_key :teams, :leagues
  end
end
