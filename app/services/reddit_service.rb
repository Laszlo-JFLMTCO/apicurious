class RedditService
  def initialize(details = {})
    @token = details[:token]
  end

  def self.api(endpoint)
    url = RedditServiceDetails::REDDIT_API_BASE_URL + RedditServiceDetails::API_URIS[endpoint]
    response = call_api(url)
    public_send(RedditServiceDetails::API_METHODS[endpoint], response)
  end

  def self.call_api(url)
    conn = Faraday.new
    response = conn.get url do |req|
      req.headers[:Authorization] = "bearer #{@token}"
    end
    response
  end

  def self.api_me(response)
    return nil unless response.status == 200
    JSON.parse(response.body)
  end

  def self.api_subreddits_subscriber(response)
    return nil unless response.status == 200
    subreddits = JSON.parse(response.body)["data"]["children"].inject({}) do |subreddits,child|
      subreddits[child["data"]["display_name"].upcase] = SubredditSubscriber.new(:url => child["data"]["url"],
                                                                          :display_name => child["data"]["display_name"].upcase)
      subreddits
    end
    subreddits
  end

  def self.token_valid?(token)
    @token = token
    ping_reddit
  end

  def self.ping_reddit
    conn = Faraday.new
    response = conn.get 'https://oauth.reddit.com/api/v1/me/' do |req|
      req.headers[:Authorization] = "bearer #{@token}"
    end
    return false unless response.status == 200
    true
  end
end