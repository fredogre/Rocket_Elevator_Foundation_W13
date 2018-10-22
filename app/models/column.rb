class Column < ApplicationRecord
  belongs_to :battery, foreign_key: "battery_id"
  #belongs_to :building, foreign_key: "battery_id"
  has_many :elevators

  def project_type_enum
    ['Residential','Commercial','Corporate']
  end

  #def name
  #  "#{customer.battery.} Column #{self.id}"
  #end

end
