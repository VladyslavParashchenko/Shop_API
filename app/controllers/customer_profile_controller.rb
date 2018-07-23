# frozen_string_literal: true

class CustomerProfileController < ProfileController
  expose :profile, model: CustomerProfile

  protected

    def profile_params
      params.permit(:stripe_customer_token).merge(customer_id: current_user.id)
    end
end
