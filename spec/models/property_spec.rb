require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'relationships' do
    it { should have_many(:user_properties) }
    it { should have_many(:users).through(:user_properties)}

  end

  describe 'validations' do
    it { should validate_presence_of(:street_address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:postal_code) }
    it { should validate_presence_of(:status) }

  end

end
