require 'rails_helper'

RSpec.describe 'Login', :type => :feature do
  scenario 'User to allow app' do
    visit root_path

    save_and_open_page
    click_on "Login with Reddit"
    click_on "Allow"

    expect(current_path).to eq(root_path)
  end
end