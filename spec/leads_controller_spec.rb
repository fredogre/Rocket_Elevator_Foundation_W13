require "rails_helper"

RSpec.describe LeadsController do
    include RSpec::Rails::ControllerExampleGroup

    describe "new_lead" do

        specify "Should create a new lead" do

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

end