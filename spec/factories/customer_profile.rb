# frozen_string_literal: true

FactoryBot.define do
  factory :customer_profile, class: CustomerProfile do
    card_number { Faker::Finance.credit_card }
  end
end
