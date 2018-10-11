class Contact < ApplicationRecord
    has_many :quote

    def title
        "#{self.First_Name} #{self.Last_Name}"
    end
    
end
