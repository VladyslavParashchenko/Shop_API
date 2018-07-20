# frozen_string_literal: true

class CategoryController < ApplicationController
  expose :categories, -> { Category.all }
  def index
    render_collection_all_elements(categories)
  end
end
