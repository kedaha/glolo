class User < ActiveRecord::Base
  has_many :external_accounts
  has_many :posts

  validate :has_valid_credentials

  def self.oauth_find_or_create(auth_hash, user = nil)
    Rails.logger.debug auth_hash
    accounts = ExternalAccount.where(uid: auth_hash.uid)
    account = accounts.select{|a| a.provider == auth_hash.provider}.first

    if account.present?
      account.update_attributes(
        oauth_token: auth_hash.credentials.token,
        expires_at: auth_hash.credentials.expires_at,
        username: auth_hash.extra.raw_info.email,
        picture_url: auth_hash.extra.raw_info.picture
      )
      account.user
    else
      user ||= new(
        screen_name: auth_hash.extra.raw_info.email
      )
      user.external_accounts << ExternalAccount.new(
        uid: auth_hash.uid,
        oauth_token: auth_hash.credentials.token,
        expires_at: auth_hash.credentials.expires_at,
        username: auth_hash.extra.raw_info.email,
        picture_url: auth_hash.extra.raw_info.picture,
        provider: auth_hash.provider,
        type: ExternalAccount.type_from_provider(auth_hash.provider)
      )

      user.save!
      user
    end
  end

  private

  def has_valid_credentials
    # either has username and password
    ## not yet implemented
    # or has connected external account
    return if external_accounts.any?
    errors.add :base, "user needs at least one valid account profile"
  end
end
