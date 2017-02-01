Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :reddit, ENV["REDDIT_CLIENT_ID"], ENV["REDDIT_SECRET"], scope: "identity mysubreddits read", duration: "temporary", state: "statestring"
end

# OmniAuth.config.test_mode = true

# OmniAuth.config.mock_auth[:reddit] = OmniAuth::AuthHash.new({
#   :provider => "reddit",
#   :uid => "14xd0z",
#   :credentials => OmniAuth::AuthHash.new({
#     :expires => true,
#     :expires_at => 1485897069,
#     :token => "akXwggApkId3h3r8VnAiT4ZghDM"
#   })
# })


#<OmniAuth::AuthHash credentials=#<OmniAuth::AuthHash expires=true expires_at=1485900866 token="70MKzi0ACef-_JXx18qsuFV69M0"> extra=#<OmniAuth::AuthHash raw_info=#<OmniAuth::AuthHash comment_karma=0 created=1485837426.0 created_utc=1485808626.0 features=#<OmniAuth::AuthHash activity_service_read=true activity_service_write=true adblock_test=true ads_auction=true ads_auto_extend=true ads_auto_refund=true ads_prefs=true adserver_reporting=true adzerk_do_not_track=true adzerk_reporting_2=true do_not_track=true eu_cookie_policy=true expando_events=true force_https=true give_hsts_grants=true https_redirect=true image_uploads=true interest_targeting=true legacy_search_pref=true live_happening_now=true moat_tracking=true mobile_native_banner=true mobile_settings=true mobile_web_targeting=true mweb_xpromo_interstitial_fp_android=#<OmniAuth::AuthHash experiment_id=98 owner="channels" variant="control_1"> mweb_xpromo_interstitial_fp_ios=#<OmniAuth::AuthHash experiment_id=99 owner="channels" variant="control_2"> mweb_xpromo_interstitial_fp_v2=#<OmniAuth::AuthHash experiment_id=116 owner="channels" variant="control_2"> mweb_xpromo_interstitial_listing_android=#<OmniAuth::AuthHash experiment_id=100 owner="channels" variant="subreddit"> mweb_xpromo_interstitial_listing_ios=#<OmniAuth::AuthHash experiment_id=101 owner="channels" variant="control_1"> mweb_xpromo_interstitial_listing_v2=#<OmniAuth::AuthHash experiment_id=117 owner="channels" variant="control_1"> mweb_xpromo_transparent_fp=#<OmniAuth::AuthHash experiment_id=122 owner="channels" variant="control_1"> mweb_xpromo_transparent_listing=#<OmniAuth::AuthHash experiment_id=121 owner="channels" variant="control_2"> new_loggedin_cache_policy=true new_report_dialog=true orangereds_as_emails=true outbound_clicktracking=true pause_ads=true pokemongo_content=#<OmniAuth::AuthHash experiment_id=47 owner="channels" variant="carousel_bottom"> post_embed=true programmatic_ads=true screenview_events=true scroll_events=true show_rules_on_submit_page=#<OmniAuth::AuthHash experiment_id=119 owner="commeng" variant="show_3"> sticky_comments=true subreddit_rules=true upgrade_cookies=true utm_comment_links=true whitelisted_pms=true> gold_creddits=0 gold_expiration=nil has_verified_email=true hide_from_robots=false id="14xd0z" in_beta=false inbox_count=0 is_employee=false is_gold=false is_mod=false is_suspended=false link_karma=1 name="lt_testing" oauth_client_id="Ubk3_F4ADNVHVw" over_18=false suspension_expiration_utc=nil>> info=#<OmniAuth::AuthHash::InfoHash name="lt_testing"> provider="reddit" uid="14xd0z">