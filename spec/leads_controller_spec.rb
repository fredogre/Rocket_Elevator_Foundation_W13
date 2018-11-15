require "rails_helper"

RSpec.describe LeadsController do
    include RSpec::Rails::ControllerExampleGroup

    describe "create_lead" do

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

            # expect(new_lead).to receive(:save)
            
            post(:new_lead, params: lead_params)  

        end

    end

end