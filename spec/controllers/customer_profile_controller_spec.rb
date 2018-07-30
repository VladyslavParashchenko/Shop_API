# frozen_string_literal: true

require "rails_helper"

RSpec.describe CustomerProfileController, type: :controller do
  before(:each) { login(user) }
  describe "PUT #update" do
    subject { put :update, params: { id: user.id, stripe_customer_token: stripe_token } }
    let(:user) { create(:customer, :with_profile) }
    include_examples "check is return status success"
    it "stripe customer token should be change" do
      subject
      expect(json_parse_response["stripe_customer_token"]).to eq(request.params[:stripe_customer_token])
    end
  end
end
