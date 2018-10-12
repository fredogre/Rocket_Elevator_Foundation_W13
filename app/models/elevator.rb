class Elevator < ApplicationRecord
  belongs_to :column
  belongs_to :building

  def Model_enum
    ['Standard', 'Premium', 'Excelium']
  end

  def Type_enum
    ['Residential','Commercial','Corporate','Hybrid']
  end

end
