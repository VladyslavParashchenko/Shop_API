# frozen_string_literal: true

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

require "rails_helper"

RSpec.describe SellerProfile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
