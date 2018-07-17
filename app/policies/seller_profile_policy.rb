# frozen_string_literal: true

class SellerProfilePolicy < ApplicationPolicy
  def update?
    @record.seller_id == @user.id
  end
end
