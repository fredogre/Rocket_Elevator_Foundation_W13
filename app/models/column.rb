class Column < ApplicationRecord
  belongs_to :Battery
  belongs_to :Building
  has_many :Elevators

  def Type_enum
    ['Residential','Commercial','Corporate']
  end

  #def name
  #  "#{customer.battery.} Column #{self.id}"
  #end

end
