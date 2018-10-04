class QuotesController < ApplicationController
    def new
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
