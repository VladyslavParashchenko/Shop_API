# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  phone      :string
#  birthday   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#

class Seller < User
  has_many :products
  has_one :seller_profile
end
