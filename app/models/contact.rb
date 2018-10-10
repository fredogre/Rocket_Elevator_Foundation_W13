class Contact < ApplicationRecord
    has_many :quote

<<<<<<< HEAD

    def name
        "#{self.first_name} #{self.last_name}"
    end
=======
    
>>>>>>> master
end
