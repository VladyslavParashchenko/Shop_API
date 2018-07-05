# frozen_string_literal: true

FactoryBot.define do
  factory :seller, class: Seller do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    phone {Faker::PhoneNumber.cell_phone}
    birthday {Faker::Date.between(50.years.ago, 20.years.ago)}
    after(:create) do |seller|
      create(:seller_profile, seller: seller)
    end
  end
end
