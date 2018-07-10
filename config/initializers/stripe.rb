# frozen_string_literal: true

PUB_KEY = ENV["STRIPE_PUBLIC_KEY"]&.nil ? $__STRIPE_PK__ : ENV["STRIPE_PUBLIC_KEY"]
PR_KEY = ENV["STRIPE_STRIPE_KEY"]&.nil ? $__STRIPE_PK__ : ENV["STRIPE_PRIVATE_KEY"]
Rails.configuration.stripe = {
    publishable_key: PUB_KEY,
    secret_key: PR_KEY
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
