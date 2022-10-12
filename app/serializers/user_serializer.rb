class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :company, :company_domain, :email, :phone

  # - User `properties` in the POST should include first name, last name, company, company website, email, phone


end
