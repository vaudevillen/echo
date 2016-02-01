Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["12e06da5c2414e63992a502036e9e915"], ENV["5ddbbc55bf494db9a0d51ea3ceb226e6"], scope: 'playlist-read-private user-read-private user-read-email'
end