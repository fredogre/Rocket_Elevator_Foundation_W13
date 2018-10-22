class Quote < ApplicationRecord
    belongs_to :contact, required: false

    def project_type_enum
        ['Residential','Commercial','Corporate','Hybrid']
    end
end
