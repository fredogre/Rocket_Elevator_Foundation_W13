class RemoveRequestDateFromLeads < ActiveRecord::Migration[5.2]
  def change
    remove_column :leads, :Request_Date, :string
  end
end
