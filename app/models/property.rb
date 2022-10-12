class Property < ApplicationRecord
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :status, presence: true

  has_many :user_properties
  has_many :users, through: :user_properties

end
