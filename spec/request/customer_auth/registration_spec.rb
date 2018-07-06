# frozen_string_literal: true

require "rails_helper"
require "spec_helper"
RSpec.describe "Registration_test", type: :request do
  let(:user) { attributes_for(:customer) }
  describe "POST create new customer" do
    subject { post "/auth_customer", params: user }
    describe "check response status " do
      include_examples "check is return status success"
    end
    describe "check insertion in the database" do
      include_examples "check is object inserted in DB", Customer
    end
  end

end
