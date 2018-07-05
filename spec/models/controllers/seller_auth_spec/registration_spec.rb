# frozen_string_literal: true

require "rails_helper"
require "spec_helper"
RSpec.describe "Registration_test", type: :request do
  let(:user) { attributes_for(:seller) }
  describe "POST create new seller" do
    subject { post "/api/seller/auth", params: user }
    describe "try POST request register " do
      it "status should be successful" do
        subject
        expect(response.status).to eq(200)
      end
    end
    describe "check insertion in the database" do
      it "should change count of users in DB" do
        expect { subject }.to change(Seller, :count).by 1
      end
    end
    describe "check email confirmation was sent" do
      it "should return true if email confirmation was sent" do
        expect { subject }.to change(Devise.mailer.deliveries, :count).by(1)
      end
    end
  end
end
