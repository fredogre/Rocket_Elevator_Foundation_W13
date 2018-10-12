class Employee < ApplicationRecord
    belongs_to :user, required: false
    has_many :batteries
    
    def name
     "#{self.First_Name} #{self.Last_Name}"
    end
end