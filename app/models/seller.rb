# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  first_name          :string
#  last_name           :string
#  email               :string
#  phone               :string
#  birthday            :date
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  seller_profile_id   :integer
#  customer_profile_id :integer
#  type                :string
#

class Seller < User
  has_many :products
  belongs_to :seller_profile
end
