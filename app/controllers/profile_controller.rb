# frozen_string_literal: true

class ProfileController < ApplicationController
  def create
    profile = current_model.create(profile_params)
    render_item(profile)
  end

  def update
    profile = current_model.find(params[:id])
    authorize(profile)
    profile.update(profile_params)
    render_item(profile)
  end
end
