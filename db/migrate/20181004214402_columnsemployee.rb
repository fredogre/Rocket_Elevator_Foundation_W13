class Columnsemployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :userid, :string
    add_index :employees, :userid
    

  end
end
