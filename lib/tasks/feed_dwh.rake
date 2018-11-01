# Call this task to feed the Data Warehouse
# Use 'rake feed_dwh:create_fact_tables' to run this task

conn = PG::Connection.new( :host => "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", :port => 5432, :dbname => 'team4', :user => 'codeboxx', :password => 'Codeboxx1!' )

namespace :feed_dwh do
  desc "Take some colums in tables an create fact tables for the DWH"
  task create_fact_tables: :environment do

    
    #conn.exec('TRUNCATE "FactIntervention";')
    Elevator.all.take(1000).each do |e|
      query1 = "INSERT INTO \"FactIntervention\" (employee_id, building_id, elevator_id, result, status) VALUES (101, #{e.column.battery.building_id}, #{e.id}, 'Succes', 'Complete')"
      conn.exec(query1)
    end
    Column.all.take(750).each do |c|
      query2 = "INSERT INTO \"FactIntervention\" (employee_id, building_id, column_id, result, status) VALUES (101, #{c.battery.building_id}, #{c.id}, 'Succes', 'Complete')"
      conn.exec(query2)
    end
    Battery.all.take(750).each do |b|
      query3 = "INSERT INTO \"FactIntervention\" (employee_id, building_id, battery_id, result, status) VALUES (101, #{b.building_id}, #{b.id}, 'Succes', 'Complete')"
      conn.exec(query3)
    end
    # conn.exec('TRUNCATE "FactQuotes";')
    # Quote.all.each do |q|
    #   query = "INSERT INTO \"FactQuotes\" (quote_id, creation_date, nb_elevator, email, company) VALUES (#{q.id}, \'#{q.created_at.strftime('%Y-%m-%d')}\', #{q.nbshaft}, \'#{q.contact.email}\', \'#{q.contact.company}\')"
    #   conn.exec(query) 
    # end

    # conn.exec('TRUNCATE "FactElevator";')
    # Elevator.all.each do |elev|
    #   query2 = "INSERT INTO \"FactElevator\" (elevator_id, startup_date, building_id, customer_id, serial_number, building_city) VALUES (#{elev.id}, \'#{elev.startup_date}\', #{elev.column.battery.building_id}, #{elev.column_id}, \'#{elev.serial_number}\', \'#{elev.column.battery.building.address.city}\')"
    #   conn.exec(query2)
    # end
    
    # conn.exec('TRUNCATE "DimCustomers";')
    # Customer.all.each do |customer|
    #   # This query calculate the number of elevators per customer 
    #   query_result = Elevator.select(:id).where(:column_id => Column.where(:battery_id => Battery.where(:building_id => Building.where(:customer_id => customer.id))))
    #   query3 = "INSERT INTO \"DimCustomers\" (creation_date, company, contact_name, contact_email, nb_elevators, city) VALUES (\'#{customer.created_at.strftime('%Y-%m-%d')}\', \'#{customer.company}\', \'#{customer.contact_name}\', \'#{customer.contact_email}\', #{query_result.length}, \'#{customer.address.city}\')"
    #   conn.exec(query3)
    # end
    # conn.exec('TRUNCATE "FactContacts";')

    # Lead.all.each do |lead|
    #   query4 = "INSERT INTO \"FactContacts\" (contact_id, creation_date, company, email, project_name) VALUES (#{lead.id}, \'#{lead.created_at.strftime('%Y-%m-%d')}\', \'#{lead.company}\', \'#{lead.email}\', \'#{lead.project_name}\')"
    #   conn.exec(query4)
    # end
    
  end
  
end
