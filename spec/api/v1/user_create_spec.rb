require 'rails_helper'

RSpec.describe 'deposit list' do

  it 'gives me a list of users that have association with property status deactivated' do

    user1 = User.new(first_name: "Jim", last_name: "Raddle", email: "test@test.com", company: "jims bagels", company_domain: "test.com", phone: "555 555", associated_accounts: [40,41])
    property1 = Property.new(street_address: "test lane", city: "Chicago", state: "IL", postal_code: "jims bagels", company_domain: "test.com", phone: "555 555", associated_accounts: [40,41])

    # binding.pry



  end

  xit 'gives me a list of users that have association with property status deactivated' do
    # json_response = File.read('spec/fixtures/properties.json')
    # response_body = JSON.parse(json_response)
    post "/api/v1/users"

    # @header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    # get "/api/v1/users"
    # post "/api/v1/users", headers:@header, params: JSON.generate(body)
    # expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
  end


end
