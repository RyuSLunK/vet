class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.string :breed
      t.integer :age
      t.integer :weight
      t.date :date_of_last_visit

      t.timestamps
    end
  end
end
