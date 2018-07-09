# frozen_string_literal: true

class CategoryController < ApplicationController
  def index
    categories = Category.all
    render_collection_all_elements(categories)
  end
end
