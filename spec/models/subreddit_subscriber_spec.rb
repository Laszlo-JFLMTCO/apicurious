require 'rails_helper'

RSpec.describe SubredditSubscriber, :type => :model do
  describe 'all values initialized' do
    it 'INIT order 1 - can return subreddit details' do
      test_url = "test/url"
      test_display_name = "nameFORdisplay"
      test_subreddit = SubredditSubscriber.new(:url => test_url, :display_name => test_display_name)

      expect(test_subreddit).to be_a(SubredditSubscriber)
      expect(test_subreddit.url).to eq(test_url)
      expect(test_subreddit.display_name).to eq(test_display_name)
    end
    it 'INIT order 2 - can return subreddit details' do
      test_url = "url/evaluation"
      test_display_name = "displayingTHEname"
      test_subreddit = SubredditSubscriber.new(:url => test_url, :display_name => test_display_name)

      expect(test_subreddit).to be_a(SubredditSubscriber)
      expect(test_subreddit.url).to eq(test_url)
      expect(test_subreddit.display_name).to eq(test_display_name)
    end
  end
end