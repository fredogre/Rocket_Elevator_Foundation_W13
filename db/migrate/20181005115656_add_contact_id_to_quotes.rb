class AddContactIdToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :Contact_Id, :string
    add_index :quotes, :Contacts_Id
  end
end
