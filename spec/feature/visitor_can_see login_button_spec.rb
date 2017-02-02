require 'rails_helper'

RSpec.describe 'Login', :type => :feature do
  xscenario 'User to allow app' do
    VCR.use_cassette("visitor_allowing_access") do
      visit root_path

stub_omni_auth
      click_on "Login with Reddit"
      click_on "Allow"

      expect(current_path).to eq(root_path)
    end
  end
end

def stub_omni_auth
  OmniAuth.config.mock_auth[:reddit] = OmniAuth::AuthHash.new({
    :provider => "reddit",
    :uid => "14xd0z",
    :credentials => OmniAuth::AuthHash.new({
      :expires => true,
      :expires_at => 1485897069,
      :token => "akXwggApkId3h3r8VnAiT4ZghDM"
    })
  })
end