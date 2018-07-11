# frozen_string_literal: true

class ChargesController < ApplicationController
  def create
    product = Product.for_sale.find(params[:product_id])
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
          amount: seller_amount(amount),
          account: seller
      }
    )
    product.update(customer_id: current_user.id, status: :sales)
    render_charge(charge)
  rescue Stripe::StripeError => e
    render_error(e.message, 403)
  end

  protected

    def seller_amount(full_amount)
      system_percent = ENV["SYSTEM_TAX_PERCENT"].to_i
      (full_amount / 100 * (100 - system_percent)).to_i
    end
end
