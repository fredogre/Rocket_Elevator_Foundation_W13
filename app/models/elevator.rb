class Elevator < ApplicationRecord
  belongs_to :Column

  def Model_enum
    ['Standard', 'Premium', 'Excelium']
  end

  def Type_enum
    ['Residential','Commercial','Corporate','Hybrid']
  end

end
