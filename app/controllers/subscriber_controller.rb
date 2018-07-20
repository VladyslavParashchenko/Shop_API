# frozen_string_literal: true

class SubscriberController < ApplicationController
  expose :plan
  def create
    current_user.seller_profile.subscribe_for_plan(plan, params[:stripe_token])
    render_item(current_user)
  end
end
