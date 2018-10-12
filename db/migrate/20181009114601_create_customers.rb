class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.bigint :user
      t.string :company
      t.bigint :address
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.text :company_description
      t.string :service_tech_name
      t.string :service_tech_phone
      t.string :service_tech_email

      t.timestamps
    end
  end
end
