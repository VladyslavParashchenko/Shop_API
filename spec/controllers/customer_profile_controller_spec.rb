# frozen_string_literal: true

require "rails_helper"

RSpec.describe CustomerProfileController, type: :controller do
  before(:each) { login(user) }


  describe "POST #create" do
    let(:user) { create(:customer) }
    let(:customer_profile) { attributes_for(:customer_profile).merge! user_id: user.id }
    subject { post :create, params: customer_profile }
    it "returns http success" do
        subject
        expect(response).to have_http_status(200)
      end
    it "should customer_profile_customer_id equal to user.id" do
      subject
      data = json_parse
      expect(data["customer_id"]).to eq(user.id)
    end
  end



end
