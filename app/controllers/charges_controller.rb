# frozen_string_literal: true

class ChargesController < ApplicationController
  expose :product, scope: -> { Product.for_sale }, id: -> { params[:product_id] }
  def create
    amount = (product.price * 100).to_i
    customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken]
    )
    seller = product.seller.seller_profile.stripe_token
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: "Purchase #{product.name}",
      currency: "usd",
      destination: {
          amount: seller_amount(amount, product.seller.seller_profile),
          account: seller
      }
    )
    product.update(customer_id: current_user.id, status: :sold)
    render_charge(charge)
  rescue Stripe::StripeError => e
    render_error(e.message, 403)
  end

  protected

    def seller_amount(full_amount, seller_profile)
      system_percent = seller_profile.get_seller_tax
      (full_amount / 100 * (100 - system_percent)).to_i
    end
end
