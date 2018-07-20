# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  image       :string
#  status      :integer
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  seller_id   :integer
#  customer_id :integer
#

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image, :status, :price
  has_one :category
  has_one :seller
  has_one :customer
end
