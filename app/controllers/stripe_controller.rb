# frozen_string_literal: true

class StripeController < ApplicationController
  skip_before_action :authenticate_user!
  def webhooks
    event_json = JSON.parse(request.body.read)
    event = Stripe::Event.retrieve(event_json["id"])
    if event.type =~ /^customer.subscription.create/
      subscriber_profile = SellerProfile.find_by(stripe_customer_id: event.data.object.customer)
      subscriber_profile .subscription_at = Time.at(event.data.object.start).to_datetime
      subscriber_profile .subscription_expires_at = Time.at(event.data.object.current_period_end).to_datetime
      subscriber_profile .save
    end

    render nothing: true
  end
end
