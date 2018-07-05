# frozen_string_literal: true

# == Schema Information
#
# Table name: customer_profiles
#
#  id          :integer          not null, primary key
#  card_number :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class CustomerProfile < ApplicationRecord
  belongs_to :customer
end
