# frozen_string_literal: true

class ChargesController < ApplicationController
  def create
    product = Product.for_sale.find(params[:product_id])
    stripe_helper = StripeMock.create_test_helper
    stripe_helper.generate_card_token(last4: "1234")
    amount = (product.price * 100).to_i
    customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken]
    )
    seller = get_seller_stripe_account(product)
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: "Purchase #{product.name}",
      currency: "usd",
      destination: {
          amount: seller_amount(amount),
          account: seller.id
      }
    )
    product.update(customer_id: current_user.id, status: :sales)
    render_charge(charge)
  rescue Stripe::CardError => e
    render_error(e.message, 404)
  end

  protected

    def get_seller_stripe_account(product)
      Stripe::Account.retrieve(product.seller.seller_profile.stripe_token)
    end
    def seller_amount(full_amount)
      system_percent = 2
      (full_amount / 100 * (100 - system_percent)).to_i
    end
end
