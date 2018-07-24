# frozen_string_literal: true

class StripeController < ApplicationController
  skip_before_action :authenticate_user!

  def webhooks
    handle_webhook_event
    render nothing: true
  end

  protected

    def handle_webhook_event
      event = Stripe::Event.retrieve(JSON.parse(request.body.read)["id"])
      subscriber_profile = SellerProfile.find_by(stripe_customer_id: event.data.object.customer)
      subscriber_profile.set_time_frame_for_plan(event)
    end
end
