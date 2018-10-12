class Elevator < ApplicationRecord
  belongs_to :column, foreign_key: "column_id"
  belongs_to :building

  def Model_enum
    ['Standard', 'Premium', 'Excelium']
  end

  def Type_enum
    ['Residential','Commercial','Corporate','Hybrid']
  end

end
