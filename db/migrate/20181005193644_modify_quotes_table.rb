class ModifyQuotesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :nbshaft, :integer
    change_column :quotes, :unitcost, :integer
    change_column :quotes, :installcost, :integer
    change_column :quotes, :totalcost, :integer
  end
end
