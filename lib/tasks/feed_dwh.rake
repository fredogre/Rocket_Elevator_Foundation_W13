# require 'pg'

conn = PG::Connection.new( :host => "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", :port => 5432, :dbname => 'guillaume', :user => 'guillaume', :password => 'guillaume123' )

namespace :feed_dwh do
  desc "Take some colums in tables an create fact tables for the DWH"
  task create_fact_tables: :environment do
    quotes = Quote.all
    #contacts = Contact.all   

    quotes.each do |quote|
      query = "INSERT INTO "+ 34.chr + "FactQuotes" + 34.chr + "(quote_id, creation_date, nb_elevator) VALUES (#{quote.id}," + 39.chr + "#{quote.created_at.strftime('%Y-%m-%d')}" + 39.chr + ",#{quote.nbshaft});"
      conn.exec('TRUNCATE "FactQuotes";')
      conn.exec(query)#"INSERT INTO "FactQuotes" (quote_id, created_at, nb_of_elevators) VALUES  #{quote.id}, #{quote.created_at}, #{quote.nb_of_elevators};")
    end

    # contacts.each do |contact|
    #   query2 = "INSERT INTO"+34.chr+ "FactQuotes" +34.chr+ "(email, company) VALUES (" + 39.chr + "#{contact.email}" + 39.chr + ", " + 39.chr + "#{contact.Company}" + 39.chr + ");"
    #   conn.exec(query2)#"INSERT INTO "FactQuotes" (email, company) VALUES #{contact.email}, #{contact.company};")
    # end

  end

end