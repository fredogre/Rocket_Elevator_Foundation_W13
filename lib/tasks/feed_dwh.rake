# require 'pg'

conn = PG::Connection.new( :host => "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", :port => 5432, :dbname => 'guillaume', :user => 'guillaume', :password => 'guillaume123' )

namespace :feed_dwh do
  desc "Take some colums in tables an create fact tables for the DWH"
  task create_fact_tables: :environment do
    
    conn.exec('TRUNCATE "FactQuotes";')

    Quote.all.each do |q|
      query = "INSERT INTO \"FactQuotes\" (quote_id, creation_date, nb_elevator, email, company) VALUES (#{q.id}, \'#{q.created_at.strftime('%Y-%m-%d')}\', #{q.nbshaft}, \'#{q.contact.email}\', \'#{q.contact.company}\')"
      conn.exec(query) 
    end

    conn.exec('TRUNCATE "FactElevator";')

    Elevator.all.each do |elev|
      query2 = "INSERT INTO \"FactElevator\" (elevator_id, startup_date, building_id, customer_id, serial_number, building_city) VALUES (#{elev.id}, \'#{elev.startup_date}\', #{elev.column.battery.building_id}, #{elev.column_id}, \'#{elev.serial_number}\', \'#{elev.column.battery.building.address.city}\')"
      conn.exec(query2)
    end
    

    conn.exec('TRUNCATE "DimCustomers";')
    Customer.all.each do |customer|

      query_result = Elevator.select(:id).where(:column_id => Column.where(:battery_id => Battery.where(:building_id => Building.where(:customer_id => customer.id))))
      #p query_result.length
      
      #p customer.company
      
      query3 = "INSERT INTO \"DimCustomers\" (creation_date, company, contact_name, contact_email, nb_elevators, city) VALUES (\'#{customer.created_at.strftime('%Y-%m-%d')}\', \'#{customer.company}\', \'#{customer.contact_name}\', \'#{customer.contact_email}\', #{query_result.length}, \'#{customer.address.city}\')"
      #p query3
      conn.exec(query3)
    end

    #leads.each do |lead|
    #  conn.exec("TRUNCATE FactContacts")
      # conn.exec(INSERT INTO FactContacts(created_at, Company, Email, Project_Name, Lead_Id) VALUES #{lead.created_at}, #{lead.Company}, #{lead.Email}, #{lead.Project_Name}, #{lead.Lead_Id}")
      #FactContacts.create( created_at: lead.created_at, Company: lead.Company, Email: lead.Email, Project_Name: lead.Project_Name, Lead_Id: lead.lead_id)
    # end
    
  end
  
end