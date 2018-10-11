class Employees < ApplicationRecord
    belongs_to :user, required: false
    
    def name
     "#{self.first_name} #{self.last_name}"
    end
end