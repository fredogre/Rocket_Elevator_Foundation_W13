class Battery < ApplicationRecord
  belongs_to :building, foreign_key: "building_id"
  belongs_to :employee, foreign_key: "employee_id"
  #has_many :Columns
  

<<<<<<< HEAD
  def type_enum
=======
  def project_type_enum
>>>>>>> master
    ['Residential','Commercial','Corporate','Hybrid']
  end



end
