class Battery < ApplicationRecord
  belongs_to :Building

  def Type_enum
    ['Residential','Commercial','Corporate','Hybrid']
  end



end
