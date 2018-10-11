class AddUserToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :user, :bigint
  end
end
