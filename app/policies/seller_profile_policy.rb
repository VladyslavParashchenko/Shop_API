# frozen_string_literal: true

class SellerProfilePolicy < ProfilePolicy
  def update?
    @profile.seller_id == @user.id
  end
end
