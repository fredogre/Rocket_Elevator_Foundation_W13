require 'zendesk_api'
require 'sendgrid-ruby'
include SendGrid
require 'json'

class LeadsController < ApplicationController
  def new_lead
    puts "this is a new lead"
    
    binary_content = IO.binread(params[:lead][:attached_file].path) if params[:lead][:attached_file] 
    lead = Lead.new

    lead_params = params[:lead].permit!

    create_lead(lead_params)
    create_zendesk_ticket(lead_params)

    redirect_to root_path
  end
  
  # client = ZendeskAPI::Client.new do |config|
  #   config.url = ""
  #   config.username = "fredgrenier12@gmail.com"
  #   config.token = Rails.application.secrets.[:zendesk][:Xc4u5gGz8snDPEmI8xtfRtclmFFZCgfcwdDXal5l]


# token Xc4u5gGz8snDPEmI8xtfRtclmFFZCgfcwdDXal5l
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

  def create_zendesk_ticket(lead_params)
    ZendeskAPI::Ticket.new($client, :id => 1, :type => "question", :priority => "urgent") # doesn't actually send a request, must explicitly call #save!
 

    zendesk_body = 
    "#{lead_params[:full_name]} from #{lead_params[:company]} can be reached by email at #{lead_params[:email]} and at phone number #{lead_params[:phone]}.
    The department of #{lead_params[:department]} has a new project named #{lead_params[:project_name]} which would require Rocket Elevator's expertise. 
    Here is the project description:
    #{lead_params[:project_description]}
    Attached message : #{lead_params[:message]}
    
    #{lead_params[:full_name]} uploaded an attachement"
    


    ZendeskAPI::Ticket.create!($client,
    :subject =>  "#{lead_params[:project_name]}",
    :comment => { :value => zendesk_body },
    :submitter_id => 12314, 
    :type => "question",
    :priority => "urgent",

    :custom_fields => [
      {id: 360012456391, value: "#{lead_params[:full_name]}"},
      {id: 360012456411, value: "#{lead_params[:phone]}"},
      {id: 360012412792, value: "#{lead_params[:email]}"},
      {id: 360012456431, value: "#{lead_params[:company]}"},
      {id: 360012412992, value: "#{lead_params[:project_name]}"},
      {id: 360012445211, value: "#{lead_params[:project_description]}"},
      {id: 360012456651, value: "#{lead_params[:department]}"}
    ]) 

  end
 
    
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

