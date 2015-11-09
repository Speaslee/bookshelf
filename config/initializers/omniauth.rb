Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["836520278681-nkql6d8efet8t10nnje57afqa6g9s1lg.apps.googleusercontent.com
"], ENV["woIImbDGJiFZlc5EgCEV1Bzl"],
  {
    :name=>"google",
    :scope=>"email, profile, plus.me",
    :prompt =>"select_acount"

  }
end
