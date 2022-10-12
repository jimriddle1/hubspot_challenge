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
      user1 = User.create(first_name: "Jim", last_name: "Raddle", email: "test@test.com", company: "jims bagels", company_domain: "test.com", phone: "555 555")
      user2 = User.create(first_name: "Ralph", last_name: "Raddle", email: "test_2@test.com", company: "jims bagels", company_domain: "test.com", phone: "555 555")
      user3 = User.create(first_name: "Steve", last_name: "Raddle", email: "test_3@test.com", company: "jims bagels", company_domain: "test.com", phone: "555 555")
      property1 = Property.create(street_address: "test lane", city: "Chicago", state: "IL", postal_code: "12345", status: "deactivated")
      property2 = Property.create(street_address: "test lane", city: "Naperville", state: "IL", postal_code: "12345", status: "active")
      property3 = Property.create(street_address: "test lane", city: "Rockford", state: "IL", postal_code: "12345", status: "deactivated")

      user_property1 = UserProperty.create(user: user1, property: property1)
      user_property2 = UserProperty.create(user: user2, property: property2)
      user_property3 = UserProperty.create(user: user3, property: property2)
      user_property4 = UserProperty.create(user: user3, property: property3)

      parsed_json = HubspotuserService.create_users_with_deactivated_properties
      data = parsed_json

      expect(data).to be_an Array
      expect(data.first).to include :vid, :isNew

      expect(data.first[:vid]).to be_an(Integer)
      expect(data.first[:isNew]).to be_in([true, false])

    end

    it 'adds contacts to the list based on the vid numbers' do

      user1 = User.create(first_name: "Jim", last_name: "Raddle", email: "test@test.com", company: "jims bagels", company_domain: "test.com", phone: "555 555")
      user2 = User.create(first_name: "Ralph", last_name: "Raddle", email: "test_2@test.com", company: "jims bagels", company_domain: "test.com", phone: "555 555")
      user3 = User.create(first_name: "Steve", last_name: "Raddle", email: "test_3@test.com", company: "jims bagels", company_domain: "test.com", phone: "555 555")
      property1 = Property.create(street_address: "test lane", city: "Chicago", state: "IL", postal_code: "12345", status: "deactivated")
      property2 = Property.create(street_address: "test lane", city: "Naperville", state: "IL", postal_code: "12345", status: "active")
      property3 = Property.create(street_address: "test lane", city: "Rockford", state: "IL", postal_code: "12345", status: "deactivated")

      user_property1 = UserProperty.create(user: user1, property: property1)
      user_property2 = UserProperty.create(user: user2, property: property2)
      user_property3 = UserProperty.create(user: user3, property: property2)
      user_property4 = UserProperty.create(user: user3, property: property3)

      user_vid_array = HubspotuserService.create_users_with_deactivated_properties

      parsed_json = HubspotuserService.add_contacts_to_list(user_vid_array)
      data = parsed_json
      #note - this test will not work because I am do not have a valid list ID.
      #I tried the list ID off of the readme, but I might be missing something
      #because that did not work either.

      expect(data).to be_a Hash
      expect(data).to include :updated, :discarded, :invalidVids
      expect(data[:udpated]).to be_an(Array)

    end


end
