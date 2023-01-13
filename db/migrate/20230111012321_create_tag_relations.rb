class CreateTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_relations do |t|
      t.integer :label_id
      t.integer :house_id

      t.timestamps
    end
  end
end
