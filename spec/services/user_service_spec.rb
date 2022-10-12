# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'HubspotUserService' do

    it 'posts a user given some params' do
      user1 = User.create(first_name: "Jim", last_name: "Raddle", email: "test_2@test.com", company: "jims bagels", company_domain: "test.com", phone: "555 555")
      parsed_json = HubspotuserService.create_user(user1)

      data = parsed_json
      expect(data).to be_a Hash
      expect(data).to include :vid, :isNew

      expect(data[:vid]).to be_an(Integer)
      expect(data[:isNew]).to be_in([true, false])

    end

    it 'posts a set of users that have deactivated properties' do
      
    end


end
