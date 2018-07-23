# frozen_string_literal: true

class ProfileController < ApplicationController
  def update
    authorize(profile)
    profile.update(profile_params)
    render_item(profile)
  end
end
