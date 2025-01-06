# config/initializers/omniauth.rb
OmniAuth.config.allowed_request_methods = [ :get, :post ]
OmniAuth.config.mock_auth[:linkedin] = nil
