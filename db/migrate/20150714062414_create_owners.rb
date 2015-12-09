class CreateOwners < ActiveRecord::Migration
 def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :race
      t.string :location

      t.timestamps null: false
    end
  end
end
