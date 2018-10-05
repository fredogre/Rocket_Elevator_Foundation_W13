class QuotesController < ApplicationController
    def new_quote
        puts "rje suis dans new quote"

        puts params["nb_floors"]

        quote = Quote.new
        
        #quote.nb_of_floors = params["nb_floors"]
        contact_params = params[:contact]
        contact = Contact.find_or_create_by!({First_Name: contact_params[:first_name],Last_Name: contact_params[:last_name],email: contact_params[:email],Company: contact_params[:Company],email: contact_params[:email],Project_Name: contact_params[:project],Location: contact_params[:location]}) 

        if params["project_type"] == "residential"
            quote.nb_of_units = params["res_nbapartment"]
            quote.nb_of_floors = params["res_floors"]
            quote.nb_of_basements = params["res_basement"]
            
        elsif params["project_type"] == "commercial"
            quote.nb_of_units = params["com_nbbusiness"]
            quote.nb_of_floors = params["com_floors"]
            quote.nb_of_basements = params["com_basement"]
            quote.nb_of_parkings = params["com_nbparking"]
            quote.nb_of_elevators = params["com_nbshaft"]

        elsif params["project_type"] == "corpo"
            quote.nb_of_units = params["corp_nbbusiness"]
            quote.nb_of_floors = params["corp_floors"]
            quote.nb_of_basements = params["corp_basement"]
            quote.nb_of_parkings = params["corp_nbparking"]
            quote.max_occupants = params["corp_pplefloors"]
            
        elsif params["project_type"] == "hybrid"
            quote.nb_of_units = params["hybrid_nbbusiness"]
            quote.nb_of_floors = params["hybrid_floors"]
            quote.nb_of_basements = params["hybrid_basement"]
            quote.nb_of_parkings = params["hybrid_nbparking"]
            quote.max_occupants = params["hybrid_pplefloors"]
            quote.business_hours = params["hybrid_hrsactivity"]
        end

        quote.Project_Type = params["project_type"]
        quote.product_type = params["product_type"]

        quote.contact = contact
        quote.save!
        redirect_to root_path
    end

    def create
        @quote = Quote.new(quote_params)
       
        @quote.save
        redirect_to root_path
    end

    private
    def quote_params
        params.require(:quote).permit!
    end

end
