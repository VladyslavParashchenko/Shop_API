# frozen_string_literal: true

FactoryBot.define do
  factory :seller_profile, class: SellerProfile do
    card_number { Faker::Finance.credit_card }
    stripe_token "acct_1Ck5aIIe0vFkKTcN"
  end
end
