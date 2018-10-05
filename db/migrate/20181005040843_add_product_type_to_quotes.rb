class AddProductTypeToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :product_type, :string
  end
end
