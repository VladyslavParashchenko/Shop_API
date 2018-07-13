# frozen_string_literal: true

# == Schema Information
#
# Table name: seller_profiles
#
#  id                      :integer          not null, primary key
#  card_number             :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  seller_id               :integer
#  stripe_token            :string
#  card_token              :string
#  plan_id                 :integer
#  subscription_at         :datetime
#  subscription_expires_at :datetime
#  stripe_customer_id      :string
#

class SellerProfile < ApplicationRecord
  belongs_to :seller
  belongs_to :plan, optional: true

  def subscribe_for_plan(plan, card_token)
    customer = Stripe::Customer.create(
      source: card_token,
      email: seller.email,
      plan: plan.stripe_id
    )
    update(plan: plan, stripe_customer_id: customer.id)
  end

  def has_active_subscription?
    subscription_expires_at.nil? ? false : Time.now < subscription_expires_at
  end
  def get_seller_tax
    if has_active_subscription?
      plan.percent
    else
      ENV["SYSTEM_TAX_PERCENT"].nil? ? 30 : ENV["SYSTEM_TAX_PERCENT"].to_i
    end
  end
end
