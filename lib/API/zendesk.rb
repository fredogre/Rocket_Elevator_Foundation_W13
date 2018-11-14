def create_zendesk_quote_ticket(contact_params)
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

def create_zendesk_lead_ticket(lead_params)
    ZendeskAPI::Ticket.new($client, :id => 1, :type => "question", :priority => "urgent") # doesn't actually send a request, must explicitly call #save!
 
    attachement = "#{lead_params[:full_name]} uploaded an attachement : #{lead_params[:attached_file]}" if lead_params[:attached_file]
    zendesk_body = 
    "#{lead_params[:full_name]} from #{lead_params[:company]} can be reached by email at #{lead_params[:email]} and at phone number #{lead_params[:phone]}.
    The department of #{lead_params[:department]} has a new project named #{lead_params[:project_name]} which would require Rocket Elevator's expertise. 
    Here is the project description:
    #{lead_params[:project_description]}
    Attached message : #{lead_params[:message]}
    
    #{attachement}"
    


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