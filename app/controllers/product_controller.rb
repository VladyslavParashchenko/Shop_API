# frozen_string_literal: true

class ProductController < ApplicationController
  def create
    product = current_user.products.create(product_params)
    render_item(product)
  end

  def index
    products = Product.for_sale
    render_collection_pagination(products)
  end

  def update
    product = current_user.products.find(params[:id])
    product.update(product_params)
    render_item(product)
  end

  def destroy
    product = current_user.products.find(params[:id])
    product.destroy
    render_item(product)
  end

  def show
    product = Product.for_sale.find(params[:id])
    render_item(product)
  end

  def product_params
    params.permit(:name, :price, :description, :image, :category_id)
  end
end
