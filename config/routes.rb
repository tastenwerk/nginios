Rails.application.routes.draw do

  mount Caminio::V1::Auth => "/api/v1/auth"
  mount Caminio::V1::Activities => "/api/v1/activities"
  mount Caminio::V1::Users => "/api/v1/users"
  mount Caminio::V1::ApiKeys => "/api/v1/api_keys"
  mount Caminio::V1::Groups => "/api/v1/groups"
  mount Caminio::V1::Organizations => "/api/v1/organizations"
  mount Caminio::V1::AppBills => "/api/v1/app_bills"
  mount Caminio::V1::Locations => "/api/v1/locations"
  mount Caminio::V1::Mediafiles => "/api/v1/mediafiles"

end
