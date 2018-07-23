# frozen_string_literal: true

class StripeController < ApplicationController
  skip_before_action :authenticate_user!
  def webhooks
    event = Stripe::Event.retrieve(JSON.parse(request.body.read)["id"])
    subscriber_profile = SellerProfile.find_by(stripe_customer_id: event.data.object.customer)
    subscriber_profile.set_time_frame_for_plan(event)
    render nothing: true
  end
end
