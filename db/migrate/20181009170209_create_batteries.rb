class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.references :Building, foreign_key: true
      t.string :Type
      t.references :Employee, foreign_key: true
      t.date :Startup_Date
      t.date :Last_Inspection_Date
      t.binary :Operation_Certificate
      t.text :Information
      t.text :Notes

      t.timestamps
    end
  end
end
