class Address < ApplicationRecord

    def Type_enum
        ['Shipping', 'Billing', 'Physical']
    end

    def Status_enum
        ['Active', 'Inactive', 'Deleted']
    end

end
