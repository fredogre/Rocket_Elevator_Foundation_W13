class CreateAddress < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :Type
      t.string :Status
      t.string :Entity
      t.string :Street
      t.string :Suite
      t.string :City
      t.string :PostalCode
      t.string :Country
      t.text :notes

      t.timestamps
    end
  end
end
