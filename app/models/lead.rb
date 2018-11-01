class Lead < ApplicationRecord
    #has_attached_file :attached_file
    #validates_attachment_content_type :attached_file, content_type: /\Aimage\/.*\z/
    belongs_to :customer, optional: true, foreign_key: "customer_id"
end
