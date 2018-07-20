# frozen_string_literal: true

class PlanController < ApplicationController
  expose :plans, -> { Plan.all }
  def index
    render_collection_all_elements(plans)
  end
end
