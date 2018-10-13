class Employee < ApplicationRecord
    belongs_to :user, required: false
    has_many :batteries
    
    def name
     "#{self.first_name} #{self.last_name}"
    end
end