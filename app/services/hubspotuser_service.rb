class HubspotuserService
  def self.create_user(user)
    data = {
      "properties": [
        {
          "property": "firstname",
          "value": user.first_name
        },
        {
          "property": "lastname",
          "value": user.last_name
        },
        {
          "property": "website",
          "value": user.company_domain
        },
        {
          "property": "company",
          "value": user.company
        },
        {
          "property": "phone",
          "value": user.phone
        },
        {
          "property": "email",
          "value": user.email
        }
      ]
    }

    response = connection.post 'contacts/v1/contact/createOrUpdate/email/testingapis@hubspot.com/' do |req|
      req.headers[:content_type] = 'application/json'
      req.body = JSON.generate(data)
    end

    body = JSON.parse(response.body, symbolize_names: true)
    if body[:message] != nil
      return {:vid=>body[:identityProfile][:vid], :isNew=>false}
    else
      return body
    end
  end

  def self.create_users_with_deactivated_properties
    User.users_with_inactive_properties.map do |user|
      HubspotuserService.create_user(user)
    end

  end

  def self.add_contacts_to_list(user_vid_array)
    vid_array = user_vid_array.map do |user|
      user[:vid]
    end

    data = {
      "vids": vid_array
    }

    response = connection.post 'contacts/v1/lists/202210/add' do |req|
      req.headers[:content_type] = 'application/json'
      req.body = JSON.generate(data)
    end
    
    body = JSON.parse(response.body, symbolize_names: true)

  end



  def self.connection
    Faraday.new(url: 'https://api.hubapi.com',
                headers: {'Authorization' => "Bearer #{ENV['hubspot_api_key']}"})
  end
end
