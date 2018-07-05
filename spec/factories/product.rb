# frozen_string_literal: true

FactoryBot.define do
  factory :product, class: Product do
    name { "Product #{rand(2000)}" }
    status :for_sale
    price { Faker::Commerce.price(range = 10..10000.0, as_string = false) }
    association :seller, factory: :seller
    association :category, factory: :category
  end
end
