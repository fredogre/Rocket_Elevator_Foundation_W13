class Elevator < ApplicationRecord
  belongs_to :column, foreign_key: "column_id"

  def model_enum
    ['Standard', 'Premium', 'Excelium']
  end

  def project_type_enum
    ['Residential','Commercial','Corporate','Hybrid']
  end

  def status_enum
    ['Intervention', 'Active', 'Inactive']
  end

end
