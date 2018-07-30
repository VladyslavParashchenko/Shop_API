# frozen_string_literal: true

# == Schema Information
#
# Table name: charges
#
#  id               :integer          not null, primary key
#  customer_id      :integer
#  product_id       :integer
#  total_sum        :float
#  seller_sum       :float
#  tax_percent      :integer
#  status           :string
#  stripe_charge_id :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Charge < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  def pay
    amount = (product.price * 100).to_i
    seller_stripe_token = product.seller.seller_profile.stripe_token
    seller_amount = get_seller_sum(amount, product.seller.seller_profile)
    charge = Stripe::Charge.create(
      customer: customer.customer_profile.stripe_customer_token,
      amount: amount,
      description: "Purchase #{product.name}",
      currency: "usd",
      destination: {
          amount: seller_amount,
          account: seller_stripe_token
      }
    )
    product.update(status: :sold)
    update(status: charge.status, stripe_charge_id: charge.id, seller_sum: seller_amount, total_sum: amount, tax_percent: product.seller.seller_profile.get_seller_tax)
  rescue Stripe::StripeError
    update(status: charge.status, stripe_charge_id: charge.id)
  end

  protected

    def get_seller_sum(full_sum, seller_profile)
      system_percent = seller_profile.get_seller_tax
      (full_sum / 100 * (100 - system_percent)).to_i
    end
end
