class Lead < ApplicationRecord
    belongs_to :customer, optional: true, foreign_key: "customer_id"
end
