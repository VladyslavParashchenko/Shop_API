# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def initialize(user, product)
    @user = user
    @product = product
  end

  def  update?
    @user.id == @product.seller_id
  end
end
