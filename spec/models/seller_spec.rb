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

require "rails_helper"

RSpec.describe Seller, type: :model do
  describe "validations" do
    let(:seller) { FactoryBot.build(:seller) }
    describe "age validation" do
      context "with ok user" do
        it "is valid" do
          expect(seller.errors[:birthday].empty?).to be_truthy
        end
      end
      context "with invalid birthday" do
        let(:seller) { build(:seller, birthday: 12.years.ago) }
        it "is invalid" do
          seller.valid?
          expect(seller.errors[:birthday].empty?).to be_falsey
        end
      end
    end
  end
end
