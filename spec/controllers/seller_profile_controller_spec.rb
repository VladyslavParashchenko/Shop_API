# frozen_string_literal: true

require "rails_helper"

RSpec.describe SellerProfileController, type: :controller do
  before(:each) { login(user) }
  describe "POST #create" do
    let(:user) { create(:seller) }
    let(:seller_profile) { attributes_for(:seller_profile, user_id: user.id) }
    subject { post :create, params: seller_profile }
    it "returns http success" do
      subject
      expect(response).to have_http_status(200)
    end
    it "profile has seller" do
      subject
      data = json_parse_response
      expect(data["seller"]).to be
    end
    it "should seller_profile_seller_id equal to user.id" do
      subject
      data = json_parse_response
      expect(data["seller"]["id"]).to eq(user.id)
    end
  end

  describe "POST #stripe" do
    let(:user) { create(:seller, :with_profile) }
    subject { post :stripe, params: { code: "dffsdldgsknsdnbglsnkgblgb" } }
    it "returns success http status" do
      subject
      expect(response).to have_http_status(200)
    end
    it "stripe token must exist" do
      subject
      user.reload
      expect(user.seller_profile.stripe_token).not_to be_empty
    end
  end
end
