class Address < ApplicationRecord

    def Type_enum
        ['Shipping', 'Billing', 'Physical']
    end

    def Status_enum
        ['Active', 'Inactive', 'Deleted']
    end

    def title
        "#{self.street} #{self.suite}, #{self.city}, #{self.postalcode}, #{self.country}"
    end
end
