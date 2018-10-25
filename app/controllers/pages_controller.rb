class PagesController < ApplicationController

    def index
    end

    def welcome
        require 'net/http'
        require 'uri'

        uri = URI.parse("https://stream.watsonplatform.net/authorization/api/v1/token?url=https://stream.watsonplatform.net/text-to-speech/api")
        request = Net::HTTP::Get.new(uri)
        request.basic_auth("e5f3fd85-5e85-4bb0-9855-c16ba2a906fc", "knWhktlohaIq")

        req_options = {
            use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
            http.request(request)
        end

        elevator = Elevator.count
        building = Building.count
        customer = Customer.count
        user = current_user.employee.name
        elevators_down = Elevator.where(:status => 'intervention').count
        quotes = Quote.count
        leads = Lead.count
        batteries = Battery.count
        city = Address.count(:city)

        # response.code
        p response.body 
        text = "Welcome #{user}, here is a quick update. There are currently #{elevator} elevators deployed in the #{building} buildings of your #{customer} customers. Currently, #{elevators_down} elevators are not in running status and are being serviced. You currently have #{quotes} quotes awaiting processing. You currently have #{leads} leads in your contact requests. #{batteries} Batteries are deployed across #{city} cities. That's all for today. Enjoy the rest of your day!"
        token = response.body
        voice = "en-US_MichaelVoice"
        render :json => {text: text, token: token, voice: voice}
    end

    def index2
    end

    def indextemp
    end

end


