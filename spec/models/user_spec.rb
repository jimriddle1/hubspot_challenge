require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:user_properties) }
    it { should have_many(:properties).through(:user_properties)}

  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:company_domain) }
    it { should validate_presence_of(:phone) }

  end

  describe 'methods' do
    it 'should return me a list of all the users that have properties that are disalbed' do

      user1 = User.create(first_name: "Jim", last_name: "Raddle", email: "test@test.com", company: "jims bagels", company_domain: "test.com", phone: "555 555")
      user2 = User.create(first_name: "Ralph", last_name: "Raddle", email: "test@test.com", company: "jims bagels", company_domain: "test.com", phone: "555 555")
      user3 = User.create(first_name: "Steve", last_name: "Raddle", email: "test@test.com", company: "jims bagels", company_domain: "test.com", phone: "555 555")
      property1 = Property.create(street_address: "test lane", city: "Chicago", state: "IL", postal_code: "12345", status: "deactivated")
      property2 = Property.create(street_address: "test lane", city: "Naperville", state: "IL", postal_code: "12345", status: "active")
      property3 = Property.create(street_address: "test lane", city: "Rockford", state: "IL", postal_code: "12345", status: "deactivated")

      user_property1 = UserProperty.create(user: user1, property: property1)
      user_property2 = UserProperty.create(user: user2, property: property2)
      user_property3 = UserProperty.create(user: user3, property: property2)
      user_property4 = UserProperty.create(user: user3, property: property3)

      expect(User.users_with_inactive_properties).to include(user1)
      expect(User.users_with_inactive_properties).to include(user3)


    end
  end

end
