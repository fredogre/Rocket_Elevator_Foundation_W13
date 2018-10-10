class Contact < ApplicationRecord
    has_many :quote

    def name
        "#{self.First_Name} #{self.Last_Name}"
    end
    
end
