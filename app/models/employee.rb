class Employee < ApplicationRecord
    belongs_to :user, optional: true
    has_many :batteries
    validates_uniqueness_of :user_id
    
    def name
     "#{self.first_name} #{self.last_name}"
    end
end