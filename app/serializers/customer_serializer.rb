# frozen_string_literal: true

class CustomerSerializer < UserSerializer
  has_one :customer_profile
end
