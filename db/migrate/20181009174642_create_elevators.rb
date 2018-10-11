class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.bigint :column
      t.string :serial_number
      t.string :model
      t.string :project_type
      t.string :status
      t.date :startup_date
      t.date :last_inspection_date
      t.binary :inspection_certificate
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end
