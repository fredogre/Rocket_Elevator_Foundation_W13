class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.references :Column, foreign_key: true
      t.string :Serial_Number
      t.string :Model
      t.string :Type
      t.string :Status
      t.date :Startup_Date
      t.date :Last_Inspection_Date
      t.binary :Inspection_Certificate
      t.text :Information
      t.text :Notes

      t.timestamps
    end
  end
end
