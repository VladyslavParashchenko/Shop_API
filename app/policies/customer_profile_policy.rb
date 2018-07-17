# frozen_string_literal: true

class CustomerProfilePolicy < ApplicationPolicy
  def update?
    @record.customer_id == @user.id
  end
end
