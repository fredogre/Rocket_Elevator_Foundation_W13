class Removeindexquotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :contact_id, :integer
  end
end
