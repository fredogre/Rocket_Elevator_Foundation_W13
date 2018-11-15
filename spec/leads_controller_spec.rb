require "rails_helper"

RSpec.describe LeadsController do
    include RSpec::Rails::ControllerExampleGroup

    describe "new_lead" do

        specify "Should send params to create lead, Zendesk and SenGrid" do

            lead_params =  {
                :lead => {
                    :full_name=>"Mat Lortie",
                    :email=> "test",
                    :project_name=> "test"
                },
            }
           
            new_lead = double("new_lead")

            expect(controller).to receive(:create_lead) {new_lead}

            expect(controller).to receive(:create_zendesk_lead_ticket) {new_lead}

            expect(controller).to receive(:sendGrid_send_confirmation_email) {new_lead}

            # verify that the post has been done. When ok, return code 200 

            expect(response.code).to eq "200"
            
            post(:new_lead, params: lead_params)  

            # When the post is done, redirect_to root_path return code 302 

            expect(response.code).to eq "302"

        end

    end

    describe "create_lead" do

        specify "Should create a new lead" do

            attached_file = double("attached_file")   
            attached_file_binary = double("attached_file_binary")
            attached_file_path = "un path vers un fichier"
            allow(attached_file).to receive(:path) {attached_file_path} 

            lead_params =  {
                    :full_name=>"Mat Lortie",
                    :email=> "test",
                    :phone=> "4185209271",
                    :company=> "Company",
                    :project_name=> "Project",
                    :project_desc=> "test_desc",
                    :department=> "test_depart",
                    :message=> "test_message",
                    :attached_file => attached_file
            }
        
        expect(IO).to receive(:binread).with(attached_file_path) {attached_file_binary}

        # verify that the lead is created with the right values

        subject.create_lead(lead_params)

        lead = Lead.last 

        expect(lead.full_name).to eq("Mat Lortie")
        expect(lead.email).to eq("test")
        expect(lead.phone_number).to eq("4185209271")
        expect(lead.company).to eq("Company")
        expect(lead.project_name).to eq("Project")
        expect(lead.project_description).to eq("test_desc")
        expect(lead.elevators_department).to eq("test_depart")
        expect(lead.message).to eq("test_message")
        expect(lead.attached_file).to eq(attached_file_binary.to_s)    
        
        

        end

    end

    # describe "sendGrid_send_confirmation_email" do

    #     specify "Should send email with leads params" do

    #         lead_params =  {
    #             :full_name=>"Mat Lortie",
    #             :email=> "test",
    #             :project_name=> "Project",
    #         }

    #         data = JSON.parse("{
    #             \"personalizations\": [
    #               {
    #                 \"to\": [
    #                   {
    #                     \"email\": \"#{lead_params[:email]}\"
    #                   }
    #                 ],
    #                 \"dynamic_template_data\": {
    #                   \"subject\": \"Contact Request Confirmation\",
    #                   \"name\": \"#{lead_params[:full_name]}\",
    #                   \"ProjectName\": \"#{lead_params[:project_name]}\"
    #                 }
    #               }
    #             ],
    #             \"from\": {
    #               \"email\": \"rocketelevators.xyz@gmail.com\"
    #             },
    #             \"template_id\": \"d-65ddb893e67f477f8b252477065820dc\"
    #           }")

    #         sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    #         response = sg.client.mail._("send").post(request_body: data)


    #         #   expect(sg.client.mail).to receive("send").with(request_body: data)

    #         expect(sg).to receive(response)

    #         subject.sendGrid_send_confirmation_email(lead_params)
    #     end

    # end

end