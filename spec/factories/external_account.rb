FactoryGirl.define do
  factory :external_account do
    uid { SecureRandom.base64 }
    oauth_token { SecureRandom.base64 }
    expires_at { 1.week.from_now }
    username { Faker::Internet.email }
    picture_url { Faker::Internet.url }
    provider "google_oauth2"
    type "ExternalAccount::Google"
  end
end
