# frozen_string_literal: true

# == Schema Information
#
# Table name: plans
#
#  id            :integer          not null, primary key
#  stripe_id     :string           not null
#  name          :string           not null
#  display_price :decimal(, )      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Plan < ApplicationRecord
  validate :is_percent_valid
  validates :percent, numericality: { greater_than: 0 }
  has_many :seller_profiles

  def is_percent_valid
    unless percent.between?(0, 100)
      errors.add :percent, "percent must be in range (0,100)"
    end
  end
end
