class Quote < ApplicationRecord
    belongs_to :contact, required: false

    def Project_Type_enum
        ['Residential','Commercial','Corporate','Hybrid']
    end
end
