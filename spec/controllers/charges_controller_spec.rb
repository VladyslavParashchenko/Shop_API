# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChargesController, type: :controller do
  before(:each) { login(user) }
  subject { post :create, params: { product_id: product.id, stripeToken: stripe_token } }
  describe "POST #create charge" do
    let(:product) { create(:product, seller: create(:seller), price: 100) }
    let(:user) { create(:customer, :with_profile) }
    include_examples "check is return status success"
    it "return right list of fields" do
      subject
      expect(json_parse_response).to include("id", "status", "total_sum", "seller_sum", "tax_percent")
    end
  end
  describe "POST #create charge with product that was sold" do
    let(:product) { create(:product, status: :sold, seller: create(:seller), price: 100) }
    let(:user) { create(:customer, :with_profile) }
    it "return permission error" do
      subject
      data = json_parse_response
      expect(data["error"]).to include "You do not have rights to this action"
    end
  end
end
