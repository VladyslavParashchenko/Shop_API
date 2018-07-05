class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :category, foreign_key: true
    add_foreign_key :categories, :categories, column: :parent_id
    add_column :products, :seller_id, :string
    add_column :products, :customer_id, :string
    add_foreign_key :products, :user, column: :seller_id
    add_foreign_key :products, :user, column: :customer_id
    add_reference :users, :seller_profile, foreign_key: true
    add_reference :users, :customer_profile, foreign_key: true
  end
end
