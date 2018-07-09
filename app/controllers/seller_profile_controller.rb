# frozen_string_literal: true

class SellerProfileController < ProfileController
  protected

    def profile_params
      params.permit(:card_number).merge! ({ seller_id: current_user.id })
    end

    def current_model
      SellerProfile
    end
end
