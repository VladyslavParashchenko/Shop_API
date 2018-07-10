# frozen_string_literal: true

# == Schema Information
#
# Table name: seller_profiles
#
#  id          :integer          not null, primary key
#  card_number :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  seller_id   :integer
#

class SellerProfile < ApplicationRecord
  belongs_to :seller
  after_create :create_stripe_account

  def create_stripe_account
    account = Stripe::Account.create(type: :custom)
    account.external_accounts.create(external_account: card_token)
    account.save
    update(stripe_token: account.id)
  end
end
