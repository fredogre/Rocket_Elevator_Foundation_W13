class Customer < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :address

  def title
    "#{self.Company}"
  end
end
