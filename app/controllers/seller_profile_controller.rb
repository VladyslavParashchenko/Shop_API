# frozen_string_literal: true

class SellerProfileController < ProfileController
  expose :profile, model: SellerProfile

  def stripe
    credentials = JSON.parse(StripeCredentialsServise.new(params).get_credentials_by_authorization_code)
    handle_credentials(credentials)
  end

  protected

    def profile_params
      { seller_id: current_user.id }
    end

    def handle_credentials(credentials)
      if (credentials.key?("error"))
        render_error(credentials["error_description"], 400)
      else
        current_user.seller_profile.set_stripe_token(credentials["stripe_user_id"])
        render_item(current_user)
      end
    end
end
