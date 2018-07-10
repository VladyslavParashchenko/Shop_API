# frozen_string_literal: true

require "rails_helper"

RSpec.describe SellerProfileController, type: :controller do
  before(:each) { login(user) }
  describe "POST #create" do
    let(:user) { create(:seller) }
    let(:seller_profile) { attributes_for(:seller_profile).merge! user_id: user.id }
    subject { post :create, params: seller_profile }
    it "returns http success" do
        subject
        expect(response).to have_http_status(200)
      end
    it "should customer_profile_customer_id equal to user.id" do
      subject
      data = json_parse
      expect(data["seller_id"]).to eq(user.id)
    end
  end

  describe "PUT #update" do
    let(:user) { create(:seller, :with_profile) }
    subject { put :update, params: { id: user.seller_profile.id, card_number: Faker::Finance.credit_card(:mastercard) } }
    it "returns success http status" do
        subject
        expect(response).to have_http_status(200)
      end
    it "should data was changed" do
      subject
      data = json_parse
      expect(request.params[:card_number]).to eq(data["card_number"])
    end
  end
end
