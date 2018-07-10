# frozen_string_literal: true

class CustomerProfilePolicy < ProfilePolicy
  def update?
    @profile.customer_id == @user.id
  end
end
