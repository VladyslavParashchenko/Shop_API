# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :text
#  image       :string
#  name        :string
#  price       :float
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  customer_id :integer
#  seller_id   :integer
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#  index_products_on_customer_id  (customer_id)
#  index_products_on_seller_id    (seller_id)
#

require "rails_helper"

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
