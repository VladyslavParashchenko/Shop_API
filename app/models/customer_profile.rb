# frozen_string_literal: true

# == Schema Information
#
# Table name: customer_profiles
#
#  id                    :integer          not null, primary key
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  customer_id           :integer
#  stripe_customer_token :string
#

class CustomerProfile < ApplicationRecord
  belongs_to :customer
end
