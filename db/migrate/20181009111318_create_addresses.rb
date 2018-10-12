class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_type
      t.string :status
      t.string :entity
      t.string :street
      t.string :suite
      t.string :city
      t.string :postalcode
      t.string :country
      t.text :notes

      t.timestamps
    end
  end
end
