#require 'zendesk_api'
require 'sendgrid-ruby'
include SendGrid
require 'json'

class LeadsController < ApplicationController
  def new_lead
    
    binary_content = IO.binread(params[:lead][:attached_file].path) if params[:lead][:attached_file] 

    lead_params = params[:lead].permit!

    create_lead(lead_params)
 #   create_zendesk_lead_ticket(lead_params)
    sendGrid_send_confirmation_email(lead_params)

    redirect_to root_path
  end
  
  def create_lead(lead_params)
    lead = Lead.new  
    lead.full_name = lead_params[:full_name]
    lead.email = lead_params[:email]
    lead.phone_number = lead_params[:phone]
    lead.company = lead_params[:company]
    lead.project_name = lead_params[:project_name]
    lead.project_description = lead_params[:project_desc]
    lead.elevators_department = lead_params[:department]
    lead.message = lead_params[:message]
    #lead.Request_Date = Time.now.strftime("%Y/%m/%d %H:%M:%S")

    unless lead_params[:attached_file].nil?
      binary_content = IO.binread(lead_params[:attached_file].path) 
      lead.attached_file = binary_content
    end

    lead.save!
  end
    
  #def sendGrid_send_confirmation_email(lead_params)

   # data = JSON.parse("{
    #  \"personalizations\": [
     #   {
      #    \"to\": [
       #     {
        #      \"email\": \"#{lead_params[:email]}\"
         #   }
          #],
          #\"dynamic_template_data\": {
           # \"subject\": \"Contact Request Confirmation\",
            #\"name\": \"#{lead_params[:full_name]}\",
            #\"ProjectName\": \"#{lead_params[:project_name]}\"
          #}
        #}
      #],
      #\"from\": {
       # \"email\": \"rocketelevators.xyz@gmail.com\"
      #},
     # \"template_id\": \"d-65ddb893e67f477f8b252477065820dc\"
   # }")
    
    #sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

    #begin
     #   response = sg.client.mail._("send").post(request_body: data)
    #rescue Exception => e
     #   puts e.message
    #end
  #end

   
end
