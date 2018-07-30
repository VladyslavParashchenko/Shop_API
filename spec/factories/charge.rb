# frozen_string_literal: true

FactoryBot.define do
  factory :charge, class: Charge do
    association :product, factory: :product
    association :customer, factory: :customer
  end
end
