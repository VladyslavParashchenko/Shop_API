# frozen_string_literal: true

class ProductController < ApplicationController
  expose :products, parent: :current_user
  expose :product_for_sale, -> { Product.for_sale }
  expose :product, parent: :current_user
  skip_before_action :authenticate_user!, only: [:index, :show]
  def create
    product.save
    render_item(product)
  end

  def index
    render_collection_pagination(product_for_sale)
  end

  def update
    authorize(product)
    product.update(product_params)
    render_item(product)
  end

  def destroy
    authorize(product)
    product.destroy
    render_item(product)
  end

  def show
    product = Product.find(params[:id])
    render_item(product)
  end

  private

    def product_params
      params.permit(:name, :price, :description, :image, :category_id)
    end
end
