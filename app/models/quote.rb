class Quote < ApplicationRecord
    belongs_to :contact

    def Project_Type_enum
        ['Residential','Commercial','Corporate','Hybrid']
    end
end
