# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProductController, type: :controller do
  before(:each) { login(user) }
  let(:user) { create(:seller) }
  describe "POST #create" do
    let(:category) { create(:category) }
    let(:product) { attributes_for(:product, :with_image, category_id: category.id) }
    subject { post :create, params: product }
    it "returns http success" do
      subject
      expect(response).to have_http_status(200)
    end
    it "should change Product.count by -1" do
      expect { subject }.to change(Product, :count).by 1
    end
    it "should return product with image" do
      subject
      expect(json_parse_response["image"]["url"]).to be
    end
  end
  describe "GET #index" do
    let!(:products) { create_list(:product, 12) }
    subject { get :index, params: { page: 1, per: 10 } }
    it "returns http success" do
      subject
      expect(response).to have_http_status(200)
    end
    it "should return only 10 products" do
      subject
      data = json_parse_response
      expect(data.length).to eq(10)
    end
    it "should return only 10 products" do
      subject
      data = json_parse_response
      expect(data.length).to all
    end
    it "each object has right fields" do
      subject
      expect(json_parse_response).to all include("id", "name", "status", "price", "category", "seller", "image")
    end
  end

  describe "PUT #update" do
    let(:new_product_name) { Faker::Pokemon.name }
    let(:product) { create(:product, seller: user) }
    subject { put :update, params: { id: product.id, name: new_product_name } }
    context "product owner update product" do
      it "returns object with new name" do
        subject
        data = json_parse_response
        expect(data["name"]).to eq(new_product_name)
      end
    end
    context "another user update product" do
      before(:each) { login(create(:seller)) }
      it "return permission error" do
        subject
        data = json_parse_response
        expect(data["error"]).to include "You do not have rights to this action"
      end
    end
  end
  describe "DELETE #destroy" do
    let(:product) { create(:product, seller: user) }
    subject { delete :destroy, params: { id: product.id } }
    context "product owner update product" do
      it "returns http success" do
        subject
        expect(response.status).to eq(200)
      end
      it "should change Product.count by -1" do
        product
        expect { subject }.to change(Product, :count).by -1
      end
    end
    context "another user update product" do
      before(:each) { login(create(:seller)) }
      it "return permission error" do
        subject
        data = json_parse_response
        expect(data["error"]).to include "You do not have rights to this action"
      end
    end
  end
  describe "GET #show" do
    let(:product) { create(:product, seller: user) }
    subject { get :show, params: { id: product.id } }
    it "returns http success" do
      expect(response).to have_http_status(200)
    end
    it "id of return object should equal to product.id" do
      subject
      data = json_parse_response
      expect(data["id"]).to eq(product.id)
    end
    it "return right list of fields" do
      subject
      expect(json_parse_response).to include("id", "name", "status", "price", "category", "seller", "image")
    end
  end
end
