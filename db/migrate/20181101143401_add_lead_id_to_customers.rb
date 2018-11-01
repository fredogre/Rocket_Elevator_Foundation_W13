class AddLeadIdToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :lead_id, :bigint
  end
end
