class Reddit
  attr_reader :name,
              :karma_post,
              :karma_comment,
              :subreddits_subscriber
              
  def initialize(content = {})
    @token = content[:token]
    @name = content[:name]
    @karma_post = content[:karma_post] || "0"
    @karma_comment = content[:karma_comment] || "0"
    @subreddits_subscriber = content[:subreddits_subscriber] || {}
  end

  def self.token_valid?(token)
    RedditService.token_valid?(token)
  end

  def self.user_content(reddit_id)
    user = User.find_by(reddit_id: reddit_id)
    api_me = RedditService.api(:me)
    new({
      :name => api_me["name"],
      :token => user.token,
      :karma_post => api_me["link_karma"],
      :karma_comment => api_me["comment_karma"],
      :subreddits_subscriber => RedditService.api(:subreddits_subscriber)
    })
  end

  # def api_me
  #   conn = Faraday.new
  #   response = conn.get 'https://oauth.reddit.com/api/v1/me/' do |req|
  #     req.headers[:Authorization] = "bearer #{@token}"
  #   end
  #   return nil unless response.status == 200
  #   response
  # end

  # def self.api_subreddits_subscriber
  #   conn = Faraday.new
  #   response = conn.get 'https://oauth.reddit.com/subreddits/mine/subscriber' do |req|
  #     req.headers[:Authorization] = "bearer #{@token}"
  #   end
  #   return nil unless response.status == 200
  #   subreddits = JSON.parse(response.body)["data"]["children"].inject({}) do |subreddits,child|
  #     subreddits[child["data"]["display_name"].upcase] = SubredditSubscriber.new(:url => child["data"]["url"],
  #                                                                         :display_name => child["data"]["display_name"].upcase)
  #     subreddits
  #   end
  #   subreddits
  # end
end