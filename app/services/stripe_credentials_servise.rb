# frozen_string_literal: true

class StripeCredentialsServise
  def initialize(params)
    @code = params[:code]
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
        code: @code,
        client_secret: Stripe.api_key
      )
    end
  end
end
