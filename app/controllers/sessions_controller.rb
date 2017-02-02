class SessionsController < ApplicationController
  def create
    response = request.env['omniauth.auth']

    user = User.find_or_create_by(reddit_id: response.uid)
# byebug
    user.token = response.credentials.token
    if user.name.nil?
      conn = Faraday.new
      response = conn.get 'https://oauth.reddit.com/api/v1/me/' do |req|
        req.headers[:Authorization] = "bearer #{user.token}"
      end
      user.name = JSON.parse(response.body)["name"]
    end
    user.save
    session[:user_id] = user.id
    redirect_to root_path
  end
end