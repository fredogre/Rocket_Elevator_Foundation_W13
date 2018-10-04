class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.auto-generated, :content_id
      t.string, :Last_Name
      t.string, :First_Name
      t.string, :Function
      t.string, :Email
      t.string :Password

      t.timestamps
    end
  end
end
