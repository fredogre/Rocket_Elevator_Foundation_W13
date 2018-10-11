class Contact < ApplicationRecord
    has_many :quote

    def title
        "#{self.first_name} #{self.last_name}"
    end
    
end
