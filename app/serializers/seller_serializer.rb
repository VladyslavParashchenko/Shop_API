# frozen_string_literal: true

class SellerSerializer < UserSerializer
  has_one :seller_profile
end
