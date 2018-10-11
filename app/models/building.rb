class Building < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  belongs_to :employees

  has_many :Columns
end
