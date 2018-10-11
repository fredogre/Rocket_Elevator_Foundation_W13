class Battery < ApplicationRecord
  belongs_to :building,  foreign_key: "Building_id"

  belongs_to :employee, foreign_key: "Employee_id"

  def Type_enum
    ['Residential','Commercial','Corporate','Hybrid']
  end



end
