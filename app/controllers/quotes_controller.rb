require 'zendesk_api'
class QuotesController < ApplicationController
    def new_quote
        puts "je suis dans new quote"

        puts params["nb_floors"]

        quote = Quote.new
        
        #quote.nb_of_floors = params["nb_floors"]
        contact_params = params[:contact]
        contact = Contact.find_or_create_by!({first_name: contact_params[:first_name],last_name: contact_params[:last_name],company: contact_params[:company],email: contact_params[:email],project_name: contact_params[:project],location: contact_params[:location]}) 

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

        quote.project_type = params["project_type"]
        quote.product_type = params["product_type"]

        quote.nbshaft = params["nbshaft"]
        quote.unitcost = params["unitcost"]
        quote.installcost = params["installcost"]
        quote.totalcost = params["totalcost"]

        pp params["unitcost"]
        pp params["installcost"]
        pp params["totalcost"]

        quote.contact = contact
        quote.save!
        redirect_to root_path
        create_zendesk_ticket(contact_params)
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
    def create_zendesk_ticket(contact_params)
        ZendeskAPI::Ticket.new($client, :id => 1, :type => "task", :priority => "urgent")

        zendesk_body = 
        "#{contact_params[:first_name]} #{contact_params[:last_name]} from #{contact_params[:company]} can be reached by email at #{contact_params[:email]}. 
        #{contact_params[:company]} has a new project named #{contact_params[:project]}. GO GET THEM! $$$$$"  
    
        ZendeskAPI::Ticket.create!($client,
        :subject => "#{contact_params[:project]}",
        :comment => { :value => zendesk_body },
        :submitter_id => 12314, 
        :type => "task",
        :priority => "urgent",

        :custom_fields => [
            {id: 360012456391, value: "#{contact_params[:first_name]} #{contact_params[:last_name]}"},
            {id: 360012412792, value: "#{contact_params[:email]}"},
            {id: 360012456431, value: "#{contact_params[:company]}"},
            {id: 360012412992, value: "#{contact_params[:project]}"},
          ]) 
        
    end


end
