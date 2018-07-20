# frozen_string_literal: true

require "rails_helper"

RSpec.describe PlanController, type: :controller do
  before(:each) { login(user) }
  describe "GET #index" do
    let(:user) { create(:seller, :with_profile) }
    let!(:plans) { create_list(:plan, 10) }
    subject { get :index }
    it "returns http success" do
        subject
        expect(response).to have_http_status(:success)
      end
    it "returns http success" do
      subject
      data = json_parse
      expect(data.length).to eq(Plan.count)
    end
  end

end
