# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Stripe subscription tests", type: :request do
  before(:each) do
    @plan = create_plan
    @plan_in_db = Plan.create(name: @plan.name, stripe_id: @plan.id, display_price: (@plan.amount.to_f / 100), percent: 20)
  end

  let(:user) { create(:seller, :with_profile) }
  subject(:subscribe_for_plan) { post "/stripe/subscribe_for_plan/#{@plan_in_db.id}", params: { stripe_token: stripe_token }, headers: user.create_new_auth_token }
  describe "Test subscription controller" do
    describe "subscribe for plan" do
      it "plan should be added to the seller_profile" do
        subscribe_for_plan
        data = json_parse
        expect(data["seller_profile"]["plan"]["stripe_id"]).to be
      end
    end
  end
  describe "Test webhooks" do
    let(:user_from_db) { Seller.find(user.id) }
    let(:event) { StripeMock.mock_webhook_event("customer.subscription.created", customer: user_from_db.seller_profile.stripe_customer_id) }
    subject(:call_stripe_webhook) { post "/stripe/webhooks", params: event.to_json, headers: { "CONTENT_TYPE" => "application/json" } }
    it "Dates should be added to the seller_profile" do
      subscribe_for_plan
      call_stripe_webhook
      user_from_db.reload
      expect(user_from_db.seller_profile.subscription_at).to be
      expect(user_from_db.seller_profile.subscription_expires_at).to be
    end
  end
end

def create_plan
  Stripe::Plan.create(
    amount: 2900,
    interval: "month",
    name: "Basic Plan",
    currency: "usd",
    id: "basic"
  )
end
