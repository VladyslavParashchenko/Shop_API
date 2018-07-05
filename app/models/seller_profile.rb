# == Schema Information
#
# Table name: seller_profiles
#
#  id          :integer          not null, primary key
#  card_number :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class SellerProfile < ApplicationRecord
  belongs_to :seller
end
