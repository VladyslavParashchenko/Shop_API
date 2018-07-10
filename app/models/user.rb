# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  email                  :string
#  phone                  :string
#  birthday               :date
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  type                   :string
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  tokens                 :text
#

class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User
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
