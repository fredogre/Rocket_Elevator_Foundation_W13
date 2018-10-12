class AddEmployeeIdToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :employee_id, :integer
  end
end
