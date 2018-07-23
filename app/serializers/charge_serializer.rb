# frozen_string_literal: true

# == Schema Information
#
# Table name: charges
#
#  id               :integer          not null, primary key
#  customer_id      :integer
#  product_id       :integer
#  total_sum        :float
#  seller_sum       :float
#  tax_percent      :integer
#  status           :string
#  stripe_charge_id :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ChargeSerializer < ActiveModel::Serializer
  attributes :id, :status, :total_sum, :seller_sum, :tax_percent
  has_one :customer
  has_one :product
end
