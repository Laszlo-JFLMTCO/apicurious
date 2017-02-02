class HomeController < ApplicationController

  def index
    if current_user
# byebug
      if Reddit.token_valid?(current_user.token)
        @current_user = current_user
        @reddit_user_content = Reddit.user_content(@current_user.reddit_id)
      else
        session.clear
      end
    end
  end
end