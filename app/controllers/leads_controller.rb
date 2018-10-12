class LeadsController < ApplicationController
  def new_lead
    puts "this is a new lead"
    
    binary_content = IO.binread(params[:lead][:attached_file].path)
    lead = Lead.new

    lead_params = params[:lead].permit!
    
    lead.full_name = lead_params[:full_name]
    lead.email = lead_params[:email]
    lead.phone_number = lead_params[:phone]
    lead.company = lead_params[:company]
    lead.project_name = lead_params[:project_name]
    lead.project_description = lead_params[:project_desc]
    lead.elevators_department = lead_params[:department]
    lead.message = lead_params[:message]
    lead.attached_file = binary_content
    #lead.Request_Date = Time.now.strftime("%Y/%m/%d %H:%M:%S")

    lead.save!
    redirect_to root_path
  end
end
