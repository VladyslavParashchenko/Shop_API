# frozen_string_literal: true

require "rails_helper"
RSpec.describe "Сonfirmation test", type: :request do
  let(:user) { create(:seller, confirmed_at: nil) }
  subject do
    get "/auth/confirmation", params: {
        config: "default",
        confirmation_token: user.confirmation_token,
        redirect_url: "/"
    }
  end
  describe "GET /api/auth/confirmation" do
    it "should respond with success" do
      subject
      expect(response).to be_redirect
      expect(user.reload.confirmed_at.nil?).to be_falsey
    end
  end
  describe "Not confirmed used can not sign_in" do
    subject { post "/auth/sign_in", params: { email: user.email, password: user.password } }
    describe "check response status " do
      it "status should be successful" do
        subject
        expect(response.status).to eq(401)
      end
    end
  end
end
