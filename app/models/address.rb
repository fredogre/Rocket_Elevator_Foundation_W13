class Address < ApplicationRecord

    def address_type_enum
        ['Shipping', 'Billing', 'Physical']
    end

    def status_enum
        ['Active', 'Inactive', 'Deleted']
    end

    def title
        "#{self.street} #{self.suite}, #{self.city}, #{self.postalcode}, #{self.country}"
    end
end
