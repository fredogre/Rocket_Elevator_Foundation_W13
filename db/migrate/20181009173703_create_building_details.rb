class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      t.references :Building, foreign_key: true
      t.string :Information_Key
      t.string :Value

      t.timestamps
    end
  end
end
