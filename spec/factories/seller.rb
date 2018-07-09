# frozen_string_literal: true

FactoryBot.define do
  factory :seller, class: Seller, parent: :user do
    trait :with_profile do
      after(:create) do |seller|
        create(:seller_profile, seller: seller)
      end
    end
  end
end
