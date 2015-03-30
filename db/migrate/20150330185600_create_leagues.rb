class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :skill
      t.string :description

      t.timestamps null: false
    end
  end
end
