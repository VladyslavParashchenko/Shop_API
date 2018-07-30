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

require "rails_helper"

RSpec.describe Charge, type: :model do

  let(:customer) { create(:customer, :with_profile) }
  let(:charge) { create(:charge, product: product, customer: customer) }
  let(:product) { create(:product, price: 100) }
  subject do
    charge.pay
    charge.reload
  end
  describe "Make charge" do
    it "should operation status to equal succeeded" do
      subject
      expect(charge.status).to eq("succeeded")
    end
    it "should amount operation to equal product price" do
      subject
      expect(charge.total_sum).to eq(price_to_cent(product.price))
    end
    it "should amount operation to equal product price" do
      subject
      expect(charge.seller_sum).to eq(price_after_tax(product.price, product.seller.seller_profile.get_seller_tax))
    end
    it "should amount operation to equal product price" do
      subject
      expect(charge.stripe_charge_id).to be
    end
  end
end

def price_to_cent(price)
  (price * 100).to_i
end

def price_after_tax(price, tax)
  price = price_to_cent(price)
  (price - price / 100 * tax).to_i
end
