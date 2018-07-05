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
#  seller_id   :string
#  customer_id :string
#

class Product < ApplicationRecord
  validates :price, numericality: {greater_than: 0}
  validates :name, presence: true
  enum status: { for_sale: 0, sales: 1 }
  belongs_to :seller
  belongs_to :category
end
