Rails.application.configure do
  # FEEDBACK: namespacing the credentials under stripe might be cleaner as the credentials/config grows
  #    stripe:
  #        secret_key:
  #        publishable_key:
  #        some_other_thing:
  config.stripe.secret_key = Rails.application.credentials.stripe_secret_key
  config.stripe.publishable_key = Rails.application.credentials.stripe_public_key
end
