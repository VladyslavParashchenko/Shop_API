# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChargesController, type: :controller do
  before(:each) { login(user) }
  subject { post :create, params: { product_id: product.id, stripeToken: stripe_token } }
  describe "POST #create charge with a user who does not have a subscription" do
    let(:product) { create(:product, seller: create(:seller, :with_profile), price: 100) }
    let(:user) { create(:customer) }
    it "returns http success" do
      subject
      expect(response).to have_http_status(200)
    end
    it "should amount operation to equal product price" do
      subject
      expect(json_parse_response["amount"]).to eq(amount_to_cent(product.price))
    end
    it "should amount operation to equal product price - shop tax" do
      subject
      expect(json_parse_response["destination_amount"]).to eq(7000)
    end
    it "returns successful transaction status" do
      subject
      expect(json_parse_response["status"]).to eq("succeeded")
    end
  end
  describe "POST #create charge with a user who has a subscription" do
    let(:seller) do
      user = create(:seller, :with_profile)
      user.seller_profile.update(plan: create(:plan), subscription_at: 2.days.ago, subscription_expires_at: 10.days.from_now)
      user
    end
    let(:user) { create(:customer) }
    let(:product) { create(:product, seller: seller, price: 100) }
    it "returns http success" do
      subject
      expect(response).to have_http_status(200)
    end
    it "should amount operation to equal product price" do
      subject
      expect(json_parse_response["amount"]).to eq(amount_to_cent(product.price))
    end
    it "should amount operation to equal product price" do
      subject
      expect(json_parse_response["destination_amount"]).to eq(amount_after_tax(product.price, seller.seller_profile.plan.percent))
    end
    it "returns successful transaction status" do
      subject
      expect(json_parse_response["status"]).to eq("succeeded")
    end
    it "return right list of fields" do
      subject
      expect(json_parse_response).to include("status", "amount", "description", "destination_amount")
    end
  end
end

def amount_to_cent(amount)
  (amount * 100).to_i
end

def amount_after_tax(amount, tax)
  amount = amount_to_cent(amount)
  (amount - amount / 100 * tax).to_i
end
