require 'rails_helper'

RSpec.describe 'Reddit Service Details' do
  describe 'Api Base URL' do
    it 'returns the correct URL' do
      expect(RedditServiceDetails::REDDIT_API_BASE_URL).to be_a(String)
      expect(RedditServiceDetails::REDDIT_API_BASE_URL).to eq("https://oauth.reddit.com")
    end
  end

  describe 'Reddit Api endpoints' do
    it 'Api endpoint URIs' do
      expect(RedditServiceDetails::API_URIS).to be_a(Hash)
      expect(RedditServiceDetails::API_URIS[:me]).to be_a(String)
      expect(RedditServiceDetails::API_URIS[:me]).to eq("/api/v1/me/")
      expect(RedditServiceDetails::API_URIS[:subreddits_subscriber]).to be_a(String)
      expect(RedditServiceDetails::API_URIS[:subreddits_subscriber]).to eq("/subreddits/mine/subscriber")
    end
  end

  describe 'Reddit Service methods' do
    it 'Api endpoint specific methods' do
      expect(RedditServiceDetails::API_METHODS).to be_a(Hash)
      expect(RedditServiceDetails::API_METHODS[:me]).to be_a(String)
      expect(RedditServiceDetails::API_METHODS[:me]).to eq("api_me")
      expect(RedditServiceDetails::API_METHODS[:subreddits_subscriber]).to be_a(String)
      expect(RedditServiceDetails::API_METHODS[:subreddits_subscriber]).to eq("api_subreddits_subscriber")
    end
  end

end