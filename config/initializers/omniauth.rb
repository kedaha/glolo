Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :google_oauth2, ENV['GOOGLE_DEV_CLIENT_ID'], ENV['GOOGLE_DEV_CLIENT_SECRET']
  # provider :facebook, ENV['FACEBOOK_CHI_SITE_ID'], ENV['FACEBOOK_CHI_SITE_SECRET'], display: "popup"
end
