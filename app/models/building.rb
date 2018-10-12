class Building < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  #belongs_to :employee
end
