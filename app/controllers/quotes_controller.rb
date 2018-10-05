class QuotesController < ApplicationController
    def new_quote
        puts 'rje suis dans new quote'

        puts params["nb_floors"]

        quote = Quote.new
        quote.nb_of_floors = params["nb_floors"]
        quote.save

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
