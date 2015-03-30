class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :avatar
      t.string :phone
      t.text :bio
      t.string :role
      t.boolean :active, :default => true
      t.boolean :admin, :default => false
      t.integer :goals
      t.integer :assists
      t.integer :penalties

      t.timestamps null: false
    end
  end
end
