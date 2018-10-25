require 'sendgrid-ruby'
include SendGrid
require 'json'

class LeadsController < ApplicationController
  def new_lead
    puts "this is a new lead"
    
    binary_content = IO.binread(params[:lead][:attached_file].path) if params[:lead][:attached_file] 
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

    data = JSON.parse("{
      \"personalizations\": [
        {
          \"to\": [
            {
              \"email\": \"#{lead.email}\"
            }
          ],
          \"dynamic_template_data\": {
            \"subject\": \"Contact Request Confirmation\",
            \"name\": \"#{lead.full_name}\",
            \"ProjectName\": \"#{lead.project_name}\"
          }
        }
      ],
      \"from\": {
        \"email\": \"rocketelevators.xyz@gmail.com\"
      },
      \"template_id\": \"d-65ddb893e67f477f8b252477065820dc\"
    }")
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    begin
        response = sg.client.mail._("send").post(request_body: data)
    rescue Exception => e
        puts e.message
    end
   end

  # def send_email(email, name, project_name)
  #   # using SendGrid's Ruby Library
  #   # https://github.com/sendgrid/sendgrid-ruby
    

  #   from = SendGrid::Email.new(email: 'rocketelevators.xyz@gmail.com')
  #   to = SendGrid::Email.new(email: email)
  #   subject = 'Contact confirmation'
  #   content = SendGrid::Content.new(type: 'text/html', value: "<html><body>Greetings #{name},<br><br>

  #     We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project #{project_name}.<br/><br>
  #     A representative from our team will be in touch with you very soon. We look forward to demonstrate the value of our solutions and help you choose the appropriate product given your requirements.
  #     <br><br>
  #     We’ll Talk soon<br>

  #     The Rocket Team
  #     </body></html>")
    
  #   mail = SendGrid::Mail.new(from, subject, to, content)

  #   sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  #   response = sg.client.mail._('send').post(request_body: mail.to_json)
  #   puts response.status_code
  #   puts response.body
  #   puts response.headers
  # end

end
