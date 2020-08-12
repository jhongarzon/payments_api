Rails.application.configure do
  config.stripe.secret_key = Rails.application.credentials.stripe_secret_key
  config.stripe.publishable_key = Rails.application.credentials.stripe_public_key
end