class AddColumnsToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :unitcost, :decimal
    add_column :quotes, :installcost, :decimal
    add_column :quotes, :totalcost, :decimal
  end
end
