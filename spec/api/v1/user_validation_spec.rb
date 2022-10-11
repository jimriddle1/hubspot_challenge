require 'rails_helper'

RSpec.describe 'deposit list' do

  it 'gives me a list of users that have association with property status deactivated' do
    # json_response = File.read('spec/fixtures/users.json')
    # response_body = JSON.parse(json_response, symbolize_names: true)

    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get "/api/v1/users, headers:header"
    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end


end
