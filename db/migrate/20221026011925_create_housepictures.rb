class CreateHousepictures < ActiveRecord::Migration[6.1]
  def change
    create_table :housepictures do |t|
      t.string :name
      t.binary :photo
      t.integer :house_id

      t.timestamps
    end
  end
end
