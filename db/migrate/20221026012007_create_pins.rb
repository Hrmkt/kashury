class CreatePins < ActiveRecord::Migration[6.1]
  def change
    create_table :pins do |t|
      t.integer :user_id
      t.integer :house_id

      t.timestamps
    end
  end
end
