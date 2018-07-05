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
#

require 'rails_helper'

RSpec.describe Customer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
