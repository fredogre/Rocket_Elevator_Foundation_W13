class Column < ApplicationRecord
  belongs_to :Battery

  def Type_enum
    ['Residential','Commercial','Corporate']
  end


end
