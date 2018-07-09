# frozen_string_literal: true

FactoryBot.define do
  factory :customer, class: Customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    password "12345678"
    password_confirmation "12345678"
    birthday { Faker::Date.between(50.years.ago, 20.years.ago) }
    confirmed_at { Time.now }
    trait :with_profile do
      after(:create) do |customer|
        create(:customer_profile, customer: customer)
      end
    end
  end
end
