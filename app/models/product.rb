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

class Product < ApplicationRecord
  validates :price, numericality: { greater_than: 0 }
  validates :name, presence: true
  enum status: { for_sale: 0, sold: 1 }
  belongs_to :seller
  belongs_to :category
  belongs_to :customer, optional: true
  mount_uploader :image, ImageUploader
end
