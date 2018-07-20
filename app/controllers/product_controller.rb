# frozen_string_literal: true

class ProductController < ApplicationController
  expose :products, parent: :current_user
  expose :product_for_sale, -> { Product.for_sale }
  expose :product, parent: :current_user, build_params: :thing_params

  def create
    product.save
    render_item(product)
  end

  def index
    render_collection_pagination(product_for_sale)
  end

  def update
    product.update(thing_params)
    render_item(product)
  end

  def destroy
    product.destroy
    render_item(product)
  end

  def show
    render_item(product)
  end

  private

    def thing_params
      params.permit(:name, :price, :description, :image, :category_id)
    end
end
