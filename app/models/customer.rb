class Customer < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :address
  has_many :building


  def title
    "#{self.company}"
  end
end
