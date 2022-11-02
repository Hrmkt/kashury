class AddColumnHouseDistrictId < ActiveRecord::Migration[6.1]
  def change
    add_column :houses, :district_id, :integer
  end
end
