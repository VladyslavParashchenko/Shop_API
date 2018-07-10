# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChargesController, type: :controller do
  before(:each) { login(user) }
  describe "POST #create" do
    let(:product) { create(:product, seller: create(:seller, :with_profile)) }
    let(:user) { create(:customer) }
    subject { post :create, params: { product_id: product.id, stripeToken: stripe_token } }
    it "returns http success" do
      subject
      expect(response).to have_http_status(200)
    end
    it "should amount operation to equal product price" do
      subject
      expect(json_parse["amount"]).to eq(amount_to_cent(product.price))
    end
    it "returns successful transaction status" do
      subject
      expect(json_parse["status"]).to eq("succeeded")
    end
  end

end

def amount_to_cent(amount)
  (amount * 100).to_i
end

def stripe_token
  stripe_helper = StripeMock.create_test_helper
  stripe_helper.generate_card_token(last4: "1234")
end
