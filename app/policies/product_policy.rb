# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  def update?
    @record.seller_id == @user.id
    end
  def destroy?
    @record.seller_id == @user.id
  end
end
