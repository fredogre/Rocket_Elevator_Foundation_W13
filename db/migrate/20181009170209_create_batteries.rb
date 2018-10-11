class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.bigint :building
      t.string :project_type
      t.string :status 
      t.bigint :employee
      t.date :startup_date
      t.date :last_inspection_date
      t.binary :operation_certificate
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end
