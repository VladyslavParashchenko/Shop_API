# frozen_string_literal: true

class ChargePolicy < ApplicationPolicy
  def create?
    @record.product.for_sale?
  end
end
