# frozen_string_literal: true

# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.mailer_sender = 'no-reply@cookncode.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.reconfirmable = true

  # Google Auth
  google_client = Rails.application.credentials.dig(:google_client_id)
  google_secret = Rails.application.credentials.dig(:google_secret)

  # Configure Google omniauth with proper scope
  config.omniauth :google_oauth2, google_client, google_secret,
    { scope: "contacts.readonly,userinfo.email" }
end
