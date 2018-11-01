class AddCustomerIdToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :customer_id, :bigint
  end
end
