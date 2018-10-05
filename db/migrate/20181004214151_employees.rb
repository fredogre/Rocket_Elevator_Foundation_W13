class Employees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :Last_Name
      t.string :First_Name
      t.string :Function
      t.string :Email
      

      t.timestamps
    end
  end
end
