# frozen_string_literal: true

class CustomerProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def initialize(user, profile)
    @user = user
    @profile = profile
  end

  def create?
    @profile.nil?
  end
  def update?
    @profile.customer_id == @user.id
  end
end
