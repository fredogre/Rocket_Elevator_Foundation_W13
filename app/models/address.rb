class Address < ApplicationRecord

    def Type_enum
        ['Shipping', 'Billing', 'Physical']
    end

    def Status_enum
        ['Active', 'Inactive', 'Deleted']
    end

    def address
        "#{self.Street} #{self.Suite}, #{self.City}, #{self.PostalCode}, #{self.Country}"
    end
end
