class Employees < ApplicationRecord
    belongs_to :user, required: false
    
    def name
     "#{self.First_Name} #{self.Last_Name}"
    end
end