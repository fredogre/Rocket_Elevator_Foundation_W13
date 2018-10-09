class Quote < ApplicationRecord
    belongs_to :contact

    def Project_Type_enum
        ['residential','commercial','corporate','hybrid']
    end
end
