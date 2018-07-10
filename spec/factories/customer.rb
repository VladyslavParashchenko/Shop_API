# frozen_string_literal: true

FactoryBot.define do
  factory :customer, class: Customer, parent: :user do
    trait :with_profile do
      after(:create) do |customer|
        create(:customer_profile, customer: customer)
      end
    end
  end
end
