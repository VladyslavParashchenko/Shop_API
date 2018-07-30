# frozen_string_literal: true

require "rails_helper"

RSpec.describe CategoryController, type: :controller do
  before(:each) { login(create(:seller)) }
  describe "GET #index" do
    subject { get :index }
    let(:categories) { create_list(:category, 10) }
    include_examples "check is return status success"
    it "should categories  count equal count of categories that we get" do
      categories
      subject
      data = json_parse_response
      expect(data.length).to eq(Category.count)
    end
  end
end
