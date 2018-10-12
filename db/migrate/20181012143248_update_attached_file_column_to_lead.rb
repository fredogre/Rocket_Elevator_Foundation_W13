class UpdateAttachedFileColumnToLead < ActiveRecord::Migration[5.2]
  def up
    change_column :leads, :attached_file, :binary, :limit => 5.megabytes
  end

  def down
    change_column :leads, :attached_file, :binary
  end
end
