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

class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :birthday, presence: true
  validate :validate_age
  def validate_age
    if birthday.present? && birthday > 18.years.ago
      errors.add :birthday, "age must be greater than 18"
    end
  end
end
