# frozen_string_literal: true

class SellerProfileController < ProfileController
  expose :profile, model: SellerProfile

  def stripe
    credientils_servise = StripeCredentialsServise.new(params)
    credentials = JSON.parse(credientils_servise.get_credentials_by_authorization_code)
    if (credentials.key?("error")) then
      render_error(credentials["error_description"], 403)
    else
      account_id = credentials["stripe_user_id"]
      current_user.seller_profile.update(stripe_token: account_id)
      render_item(current_user)
    end
  end

  protected

    def profile_params
      { seller_id: current_user.id }
    end
end
