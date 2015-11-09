Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["836520278681-i6cc2drij901dlhrsnbkjqkke3actorj.apps.googleusercontent.com"], ENV["nqClMIiOofMA0n9K11VGotvs"],
  {name: 'google_login', approval_prompt:''}
end
