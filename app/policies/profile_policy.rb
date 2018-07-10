# frozen_string_literal: true

class ProfilePolicy < ApplicationPolicy
  def initialize(user, profile)
    @user = user
    @profile = profile
  end
end
