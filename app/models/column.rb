class Column < ApplicationRecord
  belongs_to :Battery

  def Type_enum
    ['Residential','Commercial','Corporate']
  end

  #def name
  #  "#{customer.battery.} Column #{self.id}"
  #end

end
