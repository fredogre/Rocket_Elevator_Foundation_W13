class Battery < ApplicationRecord
  belongs_to :building

  def Type_enum
    ['Residential','Commercial','Corporate','Hybrid']
  end



end
