# frozen_string_literal: true

require "rails_helper"

RSpec.describe CustomerProfileController, type: :controller do
  before(:each) { login(user) }
  describe "POST #create" do
    let(:user) { create(:customer) }
    let(:customer_profile) { attributes_for(:customer_profile, user_id: user.id) }
    subject { post :create, params: customer_profile }
    context "create one customer profile" do
      it "returns http success" do
        subject
        expect(response).to have_http_status(200)
      end
      it "profile has customer" do
        subject
        data = json_parse_response
        expect(data["customer"]).to be
      end
      it "should customer_profile_customer_id equal to user.id" do
        subject
        data = json_parse_response
        expect(data["customer"]["id"]).to eq(user.id)
      end
    end
    context "create one more customer profile" do
      before(:each) { create(:customer_profile, customer: user) }
      it "returns http error status" do
          subject
          expect(response).to have_http_status(400)
        end
      it "return customer_id error" do
        subject
        expect(json_parse_response["errors"]).to include "customer_id"
      end
    end
  end
end
