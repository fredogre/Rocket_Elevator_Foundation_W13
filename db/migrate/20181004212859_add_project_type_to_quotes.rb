class AddProjectTypeToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :Project_Type, :string
  end
end
