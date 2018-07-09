# frozen_string_literal: true

require "rails_helper"
require "spec_helper"
RSpec.describe "Registration_test", type: :request do
  let(:user) { attributes_for(:seller) }
  describe "POST create new seller" do
    subject { post "/auth_seller", params: user }
    describe "check response status " do
      include_examples "check is return status success"
    end
    describe "check insertion in the database" do
      include_examples "check is object inserted in DB", Seller
    end
  end
end
