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

require "rails_helper"

RSpec.describe Plan, type: :model do
  describe "age validation" do
    context "with ok user" do
      let(:plan) { FactoryBot.build(:plan) }
      it "is valid" do
        expect(plan.errors[:percent].empty?).to be_truthy
      end
    end
    context "with invalid birthday" do
      let(:plan) { build(:plan, percent: 120) }
      it "is invalid" do
        plan.valid?
        expect(plan.errors[:percent].empty?).to be_falsey
      end
    end
  end
end
