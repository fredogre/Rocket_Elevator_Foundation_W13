class RemoveLeadIdFromCustomer < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :lead_id
  end
end
