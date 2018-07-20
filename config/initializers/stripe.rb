# frozen_string_literal: true

PUB_KEY = ENV.fetch("STRIPE_PUBLIC_KEY", $__STRIPE_PUBLIC)
PR_KEY = ENV.fetch("STRIPE_PRIVATE_KEY", $__STRIPE_PRIVATE__)
Rails.configuration.stripe = {
    publishable_key: PUB_KEY,
    secret_key: PR_KEY
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
