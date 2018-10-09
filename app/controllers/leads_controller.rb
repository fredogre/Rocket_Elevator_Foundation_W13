class LeadsController < ApplicationController
  def new_lead
    puts "this is a new lead"

    lead = Lead.new

    lead_params = params[:lead]

    lead.Full_Name = lead_params[:name]
    lead.Email = lead_params[:email]
    lead.Phone_Number = lead_params[:phone]
    lead.Company = lead_params[:company]
    lead.Project_Name = lead_params[:project_name]
    lead.Project_Description = lead_params[:project_desc]
    lead.Elevators_Department = lead_params[:department]
    lead.Message = lead_params[:message]
    lead.Attached_File = lead_params[:attachment]
    lead.Request_Date = Time.now.strftime("%Y/%m/%d %H:%M:%S")

    lead.save!
    redirect_to root_path
  end
end
