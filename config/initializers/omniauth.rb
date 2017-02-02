Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  # provider :reddit, ENV["REDDIT_CLIENT_ID"], ENV["REDDIT_SECRET"], scope: "identity mysubreddits read modmail", duration: "temporary", state: "statestring"
  provider :reddit, ENV["REDDIT_CLIENT_ID"], ENV["REDDIT_SECRET"], scope: "identity edit flair history modconfig modflair modlog modposts modwiki mysubreddits privatemessages read report save submit subscribe vote wikiedit wikiread", duration: "temporary", state: "statestring"

  # OmniAuth.config.test_mode = true
end
