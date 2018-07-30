# frozen_string_literal: true

require "rails_helper"

RSpec.describe PlanController, type: :controller do
  before(:each) { login(user) }
  describe "GET #index" do
    let(:user) { create(:seller) }
    let!(:plans) { create_list(:plan, 10) }
    subject { get :index }
    include_examples "check is return status success"
    it "should Plan.count in db to equal count of return object" do
      subject
      data = json_parse_response
      expect(data.length).to eq(Plan.count)
    end
    it "return right list of fields" do
      subject
      expect(json_parse_response).to all include("id", "stripe_id", "name", "display_price", "percent")
    end
  end
end
