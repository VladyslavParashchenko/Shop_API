# frozen_string_literal: true

class PlanController < ApplicationController
  def index
    render_collection_all_elements(Plan.all)
  end
end
