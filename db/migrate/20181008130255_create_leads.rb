class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :company
      t.string :email
      t.string :phone_number
      t.string :project_name
      t.string :project_description
      t.string :elevators_department
      t.text :message
      t.binary :attached_file

      t.timestamps
    end
  end
end
