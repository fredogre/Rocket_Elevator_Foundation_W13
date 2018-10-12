class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.bigint :customer
      t.bigint :address
      t.string :administrator_name
      t.string :administrator_email
      t.string :administrator_phone
      t.string :technician_name
      t.string :technician_email
      t.string :technician_phone

      t.timestamps
    end
  end
end
