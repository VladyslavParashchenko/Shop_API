# frozen_string_literal: true

class CustomerProfileController < ProfileController
  protected

    def profile_params
      { customer_id: current_user.id }
    end

    def current_model
      CustomerProfile
    end
end
