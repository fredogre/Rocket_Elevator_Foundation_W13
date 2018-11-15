require "rails_helper"
require "quotes_controller.rb"

RSpec.describe QuotesController do
    include RSpec::Rails::ControllerExampleGroup

    # it "test1" do
    #     expect(1).to eq 1            
    # end

    describe "new quote" do

        specify "Should create a new Residential quote" do

            params  =  {:contact => {
                :first_name=>"Mat",
                :last_name=>"Lortie",
                :email=>"matlortie@gmail.com",
                :company=>"Codeboxx",
                :project=>"Codeboxx building",
                :location=>"Quebec"
                },
                :res_nbapartment=> "30",
                :res_floors=> "4",
                :res_basement=> "1",
                :project_type=> "residential",
                :action=> "new_quote",
                :controller=> "quote",
                }
        
            new_quote = double("new_quote")
            
            expect(controller).to receive(:create_zendesk_quote_ticket) {1}

            # verify that the post has been done. When ok, return code 200 

            expect(response.code).to eq "200"
            
            post( :new_quote,params: params)

            # When the post is done, redirect_to root_path return code 302 
         
            expect(response.code).to eq "302"
            
            # verify that it's really a residential quote that's created with the right fields
            quote = Quote.last
            
            expect(quote.nb_of_units).to eq(params[:res_nbapartment].to_i)
            expect(quote.nb_of_floors).to eq(params[:res_floors].to_i)
            expect(quote.nb_of_basements).to eq(params[:res_basement].to_i)
            
        end

        specify "Should create a new commercial quote" do

            params  =  {:contact => {
                :first_name=>"Mat",
                :last_name=>"Lortie",
                :email=>"matlortie@gmail.com",
                :company=>"Codeboxx",
                :project=>"Codeboxx building",
                :location=>"Quebec"
                },
                :com_nbbusiness=> "30",
                :com_floors=> "4",
                :com_basement=> "1",
                :com_nbparking=> "50",
                :com_nbshaft=> "3",
                :project_type=> "commercial",
                :action=> "new_quote",
                :controller=> "quote",
                }

            new_quote = double("new_quote")
        
            expect(controller).to receive(:create_zendesk_quote_ticket) {1}

            expect(response.code).to eq "200"
            
            post( :new_quote,params: params)

            expect(response.code).to eq "302"
            
            # verify that it's really a commercial quote that's created with the right fields
            quote = Quote.last
            
            expect(quote.nb_of_units).to eq(params[:com_nbbusiness].to_i)
            expect(quote.nb_of_floors).to eq(params[:com_floors].to_i)
            expect(quote.nb_of_basements).to eq(params[:com_basement].to_i)
            expect(quote.nb_of_parkings).to eq(params[:com_nbparking].to_i)
            expect(quote.nb_of_elevators).to eq(params[:com_nbshaft].to_i)

        end

        specify "Should create a new corpo quote" do

            params  =  {:contact => {
                :first_name=>"Mat",
                :last_name=>"Lortie",
                :email=>"matlortie@gmail.com",
                :company=>"Codeboxx",
                :project=>"Codeboxx building",
                :location=>"Quebec"
                },
                :corp_nbbusiness=> "30",
                :corp_floors=> "4",
                :corp_basement=> "1",
                :corp_nbparking=> "50",
                :corp_pplefloors=> "300",
                :project_type=> "corpo",
                :action=> "new_quote",
                :controller=> "quote",
                }

            new_quote = double("new_quote")
        
            expect(controller).to receive(:create_zendesk_quote_ticket) {1}

            expect(response.code).to eq "200"
            
            post( :new_quote,params: params)

            expect(response.code).to eq "302"
            
            # verify that it's really a corporate quote that's created with the right fields
            quote = Quote.last
            
            expect(quote.nb_of_units).to eq(params[:corp_nbbusiness].to_i)
            expect(quote.nb_of_floors).to eq(params[:corp_floors].to_i)
            expect(quote.nb_of_basements).to eq(params[:corp_basement].to_i)
            expect(quote.nb_of_parkings).to eq(params[:corp_nbparking].to_i)
            expect(quote.max_occupants).to eq(params[:corp_pplefloors].to_i)

        end

        specify "Should create a new hybrid quote" do

            params  =  {:contact => {
                :first_name=>"Mat",
                :last_name=>"Lortie",
                :email=>"matlortie@gmail.com",
                :company=>"Codeboxx",
                :project=>"Codeboxx building",
                :location=>"Quebec"
                },
                :hybrid_nbbusiness=> "30",
                :hybrid_floors=> "4",
                :hybrid_basement=> "1",
                :hybrid_nbparking=> "50",
                :hybrid_pplefloors=> "300",
                :hybrid_hrsactivity=> "18",
                :project_type=> "hybrid",
                :action=> "new_quote",
                :controller=> "quote",
                }

            new_quote = double("new_quote")
        
            expect(controller).to receive(:create_zendesk_quote_ticket) {1}

            expect(response.code).to eq "200"
            
            post( :new_quote,params: params)

            expect(response.code).to eq "302"
            
            # verify that it's really a hybrid quote that's created with the right fields
            quote = Quote.last
            
            expect(quote.nb_of_units).to eq(params[:hybrid_nbbusiness].to_i)
            expect(quote.nb_of_floors).to eq(params[:hybrid_floors].to_i)
            expect(quote.nb_of_basements).to eq(params[:hybrid_basement].to_i)
            expect(quote.nb_of_parkings).to eq(params[:hybrid_nbparking].to_i)
            expect(quote.max_occupants).to eq(params[:hybrid_pplefloors].to_i)
            expect(quote.business_hours).to eq(params[:hybrid_hrsactivity].to_i)

        end


    end
    
end