class Api::V1::UsersController < ApplicationController

  def index
    users_json_response = File.read('spec/fixtures/users.json')
    response_body_users = JSON.parse(users_json_response, symbolize_names: true)

    properties_json_response = File.read('spec/fixtures/properties.json')
    response_body_properties = JSON.parse(properties_json_response, symbolize_names: true)


    deactivated_properties = response_body_properties.find_all do |property|
      property[:status] == "deactivated"
    end

    deactivated_properties_ids = deactivated_properties.map do |deactivated_property|
      deactivated_property[:account_id]
    end

    valid_users = []
    response_body_users.each do |user|
      user[:associated_accounts].each do |account|
        if deactivated_properties_ids.count(account.to_s) == 1
          valid_users << user
        end
      end
    end

    render json: { data: valid_users.uniq }, status: 200

  end

  def create
    test = index
    response_body = JSON.parse(test, symbolize_names: true)
    binding.pry
  end


end
