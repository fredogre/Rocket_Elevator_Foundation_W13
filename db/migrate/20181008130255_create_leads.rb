class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :Full_Name
      t.string :Company
      t.string :Email
      t.string :Phone_Number
      t.string :Project_Name
      t.string :Project_Description
      t.string :Elevators_Department
      t.text :Message
      t.binary :Attached_File
      t.datetime :Request_Date

      t.timestamps
    end
    add_index :leads, :Email, unique: true
  end
end
