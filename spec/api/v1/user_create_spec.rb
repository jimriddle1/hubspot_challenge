require 'rails_helper'

RSpec.describe 'deposit list' do

  xit 'gives me a list of users that have association with property status deactivated' do

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

    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }



    # body = User.users_with_inactive_properties

    post "/api/v1/users", headers:header
    # binding.pry

    # id = create(:merchant).id
    # item_params = {
    #   name: 'sunscreen',
    #   description: 'pretty good sunscreen',
    #   unit_price: 25.0,
    #   merchant_id: id
    #
    #   }
    #
    #  post '/api/v1/items', params: { item: item_params }, as: :json
    #  expect(response).to be_successful
    #
    #  created_item = Item.last
    #  expect(created_item).to be_a(Item)
    #  expect(created_item.name).to be_a(String)
    #  expect(created_item.description).to be_a(String)
    #  expect(created_item.unit_price).to be_a(Float)
    #  expect(created_item.merchant_id).to be_a(Integer)


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
