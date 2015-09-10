if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_tpLyUXSdnHx9EKLX92BkS5H0',
    :secret_key => 'sk_test_maZB5ljD4ndDN1mDK603M0WV'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]