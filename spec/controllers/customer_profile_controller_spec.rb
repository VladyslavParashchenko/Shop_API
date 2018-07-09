# frozen_string_literal: true

require "rails_helper"

RSpec.describe CustomerProfileController, type: :controller do
  before(:each) { login(user) }


  describe "GET #create" do
    let(:user) { create(:customer) }
    let(:customer_profile) { attributes_for(:customer_profile).merge! user_id: user.id }
    subject { post :create, params: customer_profile }
    it "returns http success" do
        subject
        expect(response.status).to eq(200)
      end
    it "should customer_profile_customer_id equal to user.id" do
      subject
      data = json_parse
      expect(data["customer_id"]).to eq(user.id)
    end
  end

  describe "GET #update" do
    let(:user) { create(:customer, :with_profile) }
    subject { put :update, params: { id: user.customer_profile.id, card_number: Faker::Finance.credit_card(:mastercard) } }
    it "returns http success" do
      puts CustomerProfile.where(customer_id: user.id).inspect
      subject
      expect(response.status).to eq(200)
    end
  end


end
