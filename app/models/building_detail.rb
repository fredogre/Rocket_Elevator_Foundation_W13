class BuildingDetail < ApplicationRecord
  belongs_to :building, foreign_key: "building_id"

  
end
