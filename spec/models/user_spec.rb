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

end
