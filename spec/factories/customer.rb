# frozen_string_literal: true

FactoryBot.define do
  factory :customer, class: Customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    birthday { Faker::Date.between(50.years.ago, 20.years.ago) }
    association :customer_profile, factory: :customer_profile
  end
end
