class Customer < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :address

  def title
    "#{self.company}"
  end
end
