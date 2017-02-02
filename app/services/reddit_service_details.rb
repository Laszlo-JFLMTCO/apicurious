module RedditServiceDetails
  REDDIT_API_BASE_URL = "https://oauth.reddit.com"

  API_URIS = {:me => "/api/v1/me/",
              :subreddits_subscriber => "/subreddits/mine/subscriber"}

  API_METHODS = {:me => "api_me",
                 :subreddits_subscriber => "api_subreddits_subscriber"}
end