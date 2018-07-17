# frozen_string_literal: true

class ProfileController < ApplicationController
  def create
    profile.save
    render_item(profile)
  end

  def update
    authorize(profile)
    profile.update(profile_params)
  end
end
