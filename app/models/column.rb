class Column < ApplicationRecord
  belongs_to :battery

  def Type_enum
    ['Residential','Commercial','Corporate']
  end

  #def name
  #  "#{customer.battery.} Column #{self.id}"
  #end

end
