class RemoveContactIdFromQuotes < ActiveRecord::Migration[5.2]
  def change
    rename_column :quotes, :Contact_Id, :contact_id

  end
end
