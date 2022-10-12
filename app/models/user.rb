class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :company, presence: true
  validates :company_domain, presence: true
  validates :phone, presence: true

  has_many :user_properties
  has_many :properties, through: :user_properties

  def self.users_with_inactive_properties
    User.joins(properties: :user_properties).where("properties.status = 'deactivated'").distinct
  end

end
