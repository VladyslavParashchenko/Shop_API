# frozen_string_literal: true

FactoryBot.define do
  factory :customer, class: Customer, parent: :user do
    trait :with_profile do
      after(:create) do |customer|
        customer.customer_profile.update(stripe_customer_token: stripe_token)
      end
    end
  end
end
