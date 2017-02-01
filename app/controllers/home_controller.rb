class HomeController < ApplicationController

  def index
    @current_user = current_user
    if current_user
      @reddit_user_content = {}
      @reddit_user_content = RedditUserContent.for_user(@current_user.reddit_id)
    end
  end
end

class SubRedditSubscriber
  attr_reader :url,
              :display_name
  def initialize(details = {})
    @url = details[:url]
    @display_name = details[:display_name]
  end
end

class RedditUserContent
  attr_reader :name,
              :karma_post,
              :karma_comment,
              :subreddits_subscriber
              
  def initialize(content = {})
    @token = content[:token]
    api_me
    @subreddits_subscriber = api_subreddits_subscriber
    @name = content[:name]
    @karma_post = content[:karma_post] || "0"
    @karma_comment = content[:karma_comment] || "0"
    # @subreddits_subscriber = content[:subreddits_subscriber] || []
  end

  def self.for_user(reddit_id)
    user = User.find_by(reddit_id: reddit_id)
    new({
      :name => user.name,
      :token => user.token
    })
  end

  def api_me
    conn = Faraday.new
    response = conn.get 'https://oauth.reddit.com/api/v1/me/' do |req|
      req.headers[:Authorization] = "bearer #{@token}"
    end
    return nil unless response.status == 200
    response
  end

  def api_subreddits_subscriber
    conn = Faraday.new
    response = conn.get 'https://oauth.reddit.com/subreddits/mine/subscriber' do |req|
      req.headers[:Authorization] = "bearer #{@token}"
    end
    return nil unless response.status == 200
    subreddits = JSON.parse(response.body)["data"]["children"].inject({}) do |subreddits,child|
      subreddits[child["data"]["display_name"].upcase] = SubRedditSubscriber.new(:url => child["data"]["url"],
                                                                          :display_name => child["data"]["display_name"].upcase)
      subreddits
    end
    subreddits
  end
end