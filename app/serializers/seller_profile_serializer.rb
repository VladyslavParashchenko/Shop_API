# frozen_string_literal: true

# == Schema Information
#
# Table name: seller_profiles
#
#  id                      :integer          not null, primary key
#  card_number             :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  seller_id               :integer
#  stripe_token            :string
#  card_token              :string
#  plan_id                 :integer
#  subscription_at         :datetime
#  subscription_expires_at :datetime
#  stripe_customer_id      :string
#


class SellerProfileSerializer < ActiveModel::Serializer
  attributes :id, :plan
end
