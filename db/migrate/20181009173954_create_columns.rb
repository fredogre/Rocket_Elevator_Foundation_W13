class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.references :Battery, foreign_key: true
      t.string :Type
      t.integer :Number_Of_Floors
      t.string :Status
      t.text :Information
      t.text :Notes

      t.timestamps
    end
  end
end
