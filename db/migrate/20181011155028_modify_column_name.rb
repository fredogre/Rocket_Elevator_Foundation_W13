class ModifyColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :batteries, :building, :building_id
    rename_column :batteries, :employee, :employee_id

    rename_column :building_details, :building, :building_id

    rename_column :buildings, :customer, :customer_id
    rename_column :buildings, :address, :address_id

    rename_column :columns, :battery, :battery_id

    rename_column :customers, :user, :user_id
    rename_column :customers, :address, :address_id

    rename_column :elevators, :column, :column_id

    rename_column :employees, :user, :user_id
  end
end
