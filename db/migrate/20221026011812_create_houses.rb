class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :address
      t.string :floorplan
      t.integer :age
      t.integer :price
      t.string :tel
      t.boolean :renovation
      t.text :detail

      t.timestamps
    end
  end
end
