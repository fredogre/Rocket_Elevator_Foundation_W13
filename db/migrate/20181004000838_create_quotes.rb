class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :project_type
      t.string :product_type
      t.integer :nb_of_units
      t.integer :nb_of_floors
      t.integer :nb_of_basements
      t.integer :nb_of_parkings
      t.integer :nb_of_elevators
      t.integer :max_occupants
      t.integer :business_hours
      t.integer :nbshaft
      t.integer :unitcost
      t.integer :installcost
      t.integer :totalcost
      t.integer :contact_id
      t.timestamps
    end
  end
end
