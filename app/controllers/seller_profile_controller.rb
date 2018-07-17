# frozen_string_literal: true

class SellerProfileController < ProfileController
  expose :profile, model: SellerProfile
  def stripe
    credentials = JSON.parse(get_credentials_by_authorization_code)
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

    def get_credentials_by_authorization_code
      if ENV["RAILS_ENV"] == "test"
        {
            access_token: "sk_test_randomstring",
            livemode: false,
            refresh_token: "rt_randomstring",
            token_type: "bearer",
            stripe_publishable_key: "pk_test_randomstring",
            stripe_user_id: "acct_randomstring",
            scope: "read_write"
        }.to_json
      else
        Stripe::OAuth.token(
          grant_type: "authorization_code",
          code: params[:code],
          client_secret: Stripe.api_key
          )
      end
    end
end
