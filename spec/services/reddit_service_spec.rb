require 'rails_helper'

RSpec.describe 'Reddit Service', :type => :feature do
  describe '/api/v1/me' do
    it 'can receive user information' do
      VCR.use_cassette("api_me") do
        response = RedditService.api(:me)

        expect(response["name"]).to eq("lt_testing")
        expect(response["link_karma"]).to eq(1)
        expect(response["comment_karma"]).to eq(0)
      end
    end
  end

  describe '/subreddits/mine/subscriber' do
    it 'can receive subreddit list' do
      VCR.use_cassette("subreddits_subscriber") do
        response = RedditService.api(:subreddits_subscriber)
        response_keys = response.keys.sort

        expect(response.keys.count).to eq(25)
        expect(response[response_keys.first]).to be_a(SubredditSubscriber)
      end
    end
  end
  
end