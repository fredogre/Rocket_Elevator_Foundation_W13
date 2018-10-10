class Contact < ApplicationRecord
    has_many :quote


    def name
        "#{self.first_name} #{self.last_name}"
    end
end
