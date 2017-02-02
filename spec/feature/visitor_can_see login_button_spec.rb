require 'rails_helper'

RSpec.describe 'Login', :type => :feature do
  scenario 'User to allow app' do
    VCR.use_cassette("visitor_allowing_access") do
      login_with_reddit

      expect(current_path).to eq(root_path)
      expect(page).to have_content("MY SUBREDDITS")
    end
  end
end
