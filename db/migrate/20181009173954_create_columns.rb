class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.bigint :battery
      t.string :project_type
      t.integer :number_of_floors
      t.string :status
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end
