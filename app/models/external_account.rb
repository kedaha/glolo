class ExternalAccount < ActiveRecord::Base
  PROVIDER_HASH = {
    "google_oauth2" => "ExternalAccount::Google"
  }
  belongs_to :user

  validates :user, presence: true

  def self.type_from_provider(val)
    PROVIDER_HASH[val]
  end
end
