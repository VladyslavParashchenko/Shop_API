# frozen_string_literal: true

FactoryBot.define do
  factory :customer_profile, class: CustomerProfile do
    stripe_customer_token { stripe_token }
  end
end
