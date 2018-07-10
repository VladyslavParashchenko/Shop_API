# frozen_string_literal: true

FactoryBot.define do
  factory :seller_profile, class: SellerProfile do
    card_number { Faker::Finance.credit_card }
    card_token "tok_mastercard_debit"
  end
end
