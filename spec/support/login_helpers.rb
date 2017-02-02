module LoginHelpers
  def login_with_reddit
    visit root_path
    stub_omniauth

    click_on "Login"
  end

    def stub_omniauth
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:reddit] = OmniAuth::AuthHash.new(
        {
          provider: 'reddit',
          uid: "14xd0z",
          info: {
            name: "lt_testing",
          },
          credentials: {
            token: "t6i76o3GwMLkosnpxvpAvRbhIRk"
          }, 
          extra: {
            raw_info: {
              email: "test@test.com",
              subreddit_data: "AWWW"
            } 
          }
        } 
      )
    end

# NON WORKING CODE!!!
  # def stub_omni_auth
  #   OmniAuth.config.mock_auth[:reddit] = OmniAuth::AuthHash.new({
  #     :provider => "reddit",
  #     :uid => "14xd0z",
  #     :credentials => OmniAuth::AuthHash.new({
  #       :expires => true,
  #       :expires_at => 1486057493,
  #       :token => "t6i76o3GwMLkosnpxvpAvRbhIRk"
  #     })
  #   })
  # end
end