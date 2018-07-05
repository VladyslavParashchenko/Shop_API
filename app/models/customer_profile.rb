# == Schema Information
#
# Table name: customer_profiles
#
#  id          :integer          not null, primary key
#  card_number :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CustomerProfile < ApplicationRecord
  has_one :customer
end
