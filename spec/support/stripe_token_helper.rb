# frozen_string_literal: true

def stripe_token
  stripe_helper = StripeMock.create_test_helper
  stripe_helper.generate_card_token(last4: "1234")
end
