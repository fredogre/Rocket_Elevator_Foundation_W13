class Removeindexquotes < ActiveRecord::Migration[5.2]
  def change
    change_column :quotes, :contact_id, :integer
  end
end
