require "ibm_watson"
require "rails_admin_greetings/engine"

module RailsAdminGreetings
  # Your code goes here...
end

require 'rails_admin/config/actions'

module RailsAdmin
  module Config
    module Actions
      class Greetings < Base
        RailsAdmin::Config::Actions.register(self)
        
        register_instance_option :object_level do
          true  
        end
      end
    end
  end
end