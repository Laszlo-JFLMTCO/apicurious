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
end