class Building < ApplicationRecord
  belongs_to :customer, foreign_key: "customer_id"
  belongs_to :address, foreign_key: "address_id"
  belongs_to :employee, foreign_key: "employee_id"
  has_many :batteries
end
