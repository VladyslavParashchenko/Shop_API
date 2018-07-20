# frozen_string_literal: true

# == Schema Information
#
# Table name: plans
#
#  id            :integer          not null, primary key
#  stripe_id     :string           not null
#  name          :string           not null
#  display_price :decimal(, )      not null
#  percent       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PlanSerializer < ActiveModel::Serializer
  attributes :id, :stripe_id, :name, :display_price, :percent
end
