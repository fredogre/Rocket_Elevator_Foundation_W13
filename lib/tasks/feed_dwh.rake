# require 'pg'

conn = PG::Connection.new( :host => "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", :port => 5432, :dbname => 'guillaume', :user => 'guillaume', :password => 'guillaume123' )

namespace :feed_dwh do
  desc "Take some colums in tables an create fact tables for the DWH"
  task create_fact_tables: :environment do
    
    conn.exec('TRUNCATE "FactQuotes";')

    Quote.all.each do |q|
      query = "INSERT INTO \"FactQuotes\" (quote_id, creation_date, nb_elevator, email, company) VALUES (#{q.id}, \'#{q.created_at.strftime('%Y-%m-%d')}\', #{q.nbshaft}, \'#{q.contact.email}\', \'#{q.contact.Company}\')"
      conn.exec(query) 
    end

    conn.exec('TRUNCATE "FactElevator";')

    Elevator.all.each do |elev|
      query2 = "INSERT INTO \"FactElevator\" ()"

   #leads.each do |lead|
   #  conn.exec("TRUNCATE FactContacts")
    # conn.exec(INSERT INTO FactContacts(created_at, Company, Email, Project_Name, Lead_Id) VALUES #{lead.created_at}, #{lead.Company}, #{lead.Email}, #{lead.Project_Name}, #{lead.Lead_Id}")
     #FactContacts.create( created_at: lead.created_at, Company: lead.Company, Email: lead.Email, Project_Name: lead.Project_Name, Lead_Id: lead.lead_id)
  # end
    
  end
  
end