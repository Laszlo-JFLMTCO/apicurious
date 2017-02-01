Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :reddit, ENV["REDDIT_CLIENT_ID"], ENV["REDDIT_SECRET"], scope: "identity mysubreddits read", duration: "temporary", state: "statestring"
end
