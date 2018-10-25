class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable, :registerable,
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :timeoutable, :registerable

  has_one :employee

  def title
    "#{self.email}"
  end
end
