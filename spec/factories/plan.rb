# frozen_string_literal: true

FactoryBot.define do
  factory :plan, class: Plan do
    stripe_id "sid_0000000000"
    name { Faker::Pokemon.name }
    display_price { Faker::Commerce.price(range = 1..25.0, as_string = false) }
    percent { Faker::Number.between(1, 100) }
  end
end
