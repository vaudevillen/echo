Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GMAPS"], ENV["GSECRET"]
end
