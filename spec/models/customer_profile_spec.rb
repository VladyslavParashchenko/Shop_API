# == Schema Information
#
# Table name: customer_profiles
#
#  id          :integer          not null, primary key
#  card_number :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe CustomerProfile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end