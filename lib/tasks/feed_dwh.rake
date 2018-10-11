namespace :feed_dwh do

  conn = PG::Connection.new( :host => "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", :port => 5432, :dbname => 'guillaume', :user => 'guillaume', :password => 'guillaume123' )

  desc "Take some colums in tables an create fact tables for the DWH"
  task create_fact_tables: :environment do
    quotes = Quote.all

    quotes.each do |quote|
      conn.exec("TRUNCATE FactQuotes")
      conn.exec("INSERT INTO FactQuotes(quote_id, created_at, nb_of_elevators) VALUES #{quote.quote_id}, #{quote.created_at}, #{quote.nb_of_elevators}")
     FactQuotes.create(quote_id: quote.quote_id, created_at: quote.created_at, nb_of_elevators: quote.nb_of_elevators)
    end

  end

  desc "Take some colums in tables and create fact contact for the DWH"
  task create_fact_tables: :environment do 
    leads = Lead.all

    leads.each do |lead|
      conn.exec("TRUNCATE FactContacts")
      conn.exec(INSERT INTO FactContacts(created_at, Company, Email, Project_Name, Lead_Id) VALUES #{lead.created_at}, #{lead.Company}, #{lead.Email}, #{lead.Project_Name}, #{lead.Lead_Id}")
      FactContacts.create( created_at: lead.created_at, Company: lead.Company, Email: lead.Email, Project_Name: lead.Project_Name, Lead_Id: lead.lead_id)
    end

  end

  desc "Take some colums in tables and creat fact elevator for the DWH"
  task create_fact_tables: : environment do 
    elevators = Elevator.all

    elevators.each do |elevator|
      conn.exec("TRUNCATE FactElevators")
      conn.exec("TRUNCATE INTO FactElevator")
      FactElevators.create(Serial_Number: elevator.Serial_Number, Elevator_Id: elevator.Elevator_Id, Startup_Date: elevator.Startup_Date,)
    end

  end

end