# frozen_string_literal: true

require "rails_helper"

RSpec.describe SellerProfileController, type: :controller do
  before(:each) { login(user) }
  describe "POST #stripe" do
    let(:user) { create(:seller) }
    subject { post :stripe, params: { id: user.id, code: "dffsdldgsknsdnbglsnkgblgb" } }
    include_examples "check is return status success"
    it "stripe token must exist" do
      subject
      user.reload
      expect(user.seller_profile.stripe_token).not_to be_empty
    end
  end
end
