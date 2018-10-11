class ModifyNames < ActiveRecord::Migration[5.2]
  def change
    
    rename_column :Buildings, :administrator_full_name, :Administrator_Name
    rename_column :Buildings, :technician_full_name, :Technician_Name
    rename_column :Buildings, :administrator_email, :Administrator_Email
    rename_column :Buildings, :administrator_phone, :Administrator_Phone
    rename_column :Buildings, :technician_email, :Technician_Email
    rename_column :Buildings, :technician_phone, :Technician_Phone

    rename_column :customers, :company, :Company
    rename_column :customers, :contact_full_name, :Contact_Name
    rename_column :customers, :contact_phone, :Contact_Phone
    rename_column :customers, :contact_email, :Contact_Email
    rename_column :customers, :company_description, :Company_Description
    rename_column :customers, :service_tech_full_name, :Service_Tech_Name
    rename_column :customers, :service_tech_phone, :Service_Tech_Phone
    rename_column :customers, :service_tech_email, :Service_Tech_Email
  end
end
