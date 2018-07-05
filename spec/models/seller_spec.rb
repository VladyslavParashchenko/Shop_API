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

require "rails_helper"

RSpec.describe Seller, type: :model do
  describe "validations" do
    let(:seller) { FactoryBot::build(:seller) }
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
