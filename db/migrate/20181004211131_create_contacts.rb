class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :First_Name
      t.string :Last_Name
      t.string :Project_Name
      t.string :Location
      t.string :Company
      t.string :email

      t.timestamps
    end
  end
end
