# frozen_string_literal: true

class CustomerProfileController < ApplicationController
  def create
    profile = CustomerProfile.create(profile_params)
    render_item(profile)
  end

  def update
    profile = CustomerProfile.find(params[:id])
    authorize(profile)
    profile.update(profile_params)
    render_item(profile)
  end


  protected

    def profile_params
      params.permit(:card_number).merge! ({ customer_id: current_user.id })
    end
end
