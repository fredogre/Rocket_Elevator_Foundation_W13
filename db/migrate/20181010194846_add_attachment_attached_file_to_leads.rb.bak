class AddAttachmentAttachedFileToLeads < ActiveRecord::Migration[5.2]
  def self.up
    change_table :leads do |t|
      t.attachment :attached_file
    end
  end

  def self.down
    remove_attachment :leads, :attached_file
  end
end
