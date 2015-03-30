class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.references :team, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :rosters, :teams
    add_foreign_key :rosters, :users
  end
end
