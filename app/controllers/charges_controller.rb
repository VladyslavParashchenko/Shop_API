# frozen_string_literal: true

class ChargesController < ApplicationController
  def create
    charge = Charge.new(charge_params)
    authorize(charge)
    charge.save
    charge.pay
    render_item(charge)
  end

  def charge_params
    params.permit(:product_id).merge(customer_id: current_user.id)
  end
end
