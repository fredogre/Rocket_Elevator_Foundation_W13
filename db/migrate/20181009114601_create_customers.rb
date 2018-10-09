class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.references :user, foreign_key: true
      t.datetime :creation_date
      t.string :company
      t.references :address, foreign_key: true
      t.string :contact_full_name
      t.string :contact_phone
      t.string :contact_email
      t.text :company_description
      t.string :service_tech_full_name
      t.string :service_tech_phone
      t.string :service_tech_email
      t.string :customerid

      t.timestamps
    end
    add_index :customers, :customerid, unique: true
  end
end
