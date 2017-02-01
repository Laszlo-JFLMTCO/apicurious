class HomeController < ApplicationController

  def index
    @current_user = current_user
    @reddit_user_content = {}
    @reddit_user_content = RedditUserContent.for_user(@current_user.reddit_id)
  end
end

class RedditUserContent
  attr_reader :name,
              :karma_post,
              :karma_comment,
              :subreddits_subscriber
              
  def initialize(content = {})
    @name = content[:name]
    @karma_post = content[:karma_post] || "0"
    @karma_comment = content[:karma_comment] || "0"
    @subreddits_subsriber = content[:subreddits_subscriber] || []
  end

  def self.for_user(reddit_id)
    user = User.find_by(reddit_id: reddit_id)
    new(
      :name => user.name
    )
  end
end