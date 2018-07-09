# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProductController, type: :controller do
  before(:each) { login(user) }
  let(:user) { create(:seller) }
  describe "POST #create" do
    let(:category) { create(:category) }
    let(:product) { attributes_for(:product, :with_image).merge(category_id: category.id) }
    subject { post :create, params: product }
    it "returns http success" do
      expect(response.status).to eq(200)
    end
    it "returns http success" do
      expect { subject }.to change(Product, :count).by 1
    end
    it "should return product with image" do
      subject
      expect(json_parse["image"]["url"]).to be
    end
  end

  describe "GET #index" do
    let!(:products) { create_list(:product, 12) }
    subject { get :index, params: { page: 1, per: 10 } }
    it "returns http success" do
      subject
      expect(response.status).to eq(200)
    end
    it "should return only 10 products" do
      subject
      data = json_parse
      expect(data.length).to eq(10)
    end
  end

  describe "PUT #update" do
    let(:new_product_name) { Faker::Pokemon.name }
    let(:product) { create(:product, seller: user) }
    subject { put :update, params: { id: product.id, name: new_product_name } }
    it "returns http success" do
      subject
      data = json_parse
      expect(data["name"]).to eq(new_product_name)
    end
  end

  describe "GET #destroy" do

    let(:product) { create(:product, seller: user) }
    subject { delete :destroy, params: { id: product.id } }
    it "returns http success" do
      subject
      expect(response.status).to eq(200)
    end
    it "returns http success" do
      product
      expect { subject }.to change(Product, :count).by -1
    end
  end

  describe "GET #show" do

    let(:product) { create(:product, seller: user) }
    subject { get :show, params: { id: product.id } }
    it "returns http success" do
      expect(response.status).to eq(200)
    end
    it "returns http success" do
      subject
      data = json_parse
      expect(data["id"]).to eq(product.id)
    end
  end

end
