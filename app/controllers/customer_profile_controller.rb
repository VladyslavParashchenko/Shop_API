# frozen_string_literal: true

class CustomerProfileController < ProfileController
  protected

    def profile_params
      params.permit(:card_number, :card_token).merge! ({ customer_id: current_user.id })
    end

    def current_model
      CustomerProfile
    end
end
