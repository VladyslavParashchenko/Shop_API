# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Sessions test", type: :request do
  let(:user) { create(:customer) }
  describe "sign in" do
    subject { post "/auth/sign_in", params: { email: user.email, password: user.password } }
    context "try login with valid data" do
      include_examples "check is return status success"
      it "should controller.user_id equal user_id" do
        subject
        expect(controller.current_user.id).to eq(user.id)
      end
      it "should return access-token" do
        subject
        expect(response.has_header?("access-token")).to eq true
      end
    end
  end
  describe "sign out" do
    subject { delete "/auth/sign_out", headers: user.create_new_auth_token }
    include_examples "check is return status success"
    it "should not return access-token" do
      subject
      expect(response.has_header?("access-token")).to eq false
    end
  end
end
