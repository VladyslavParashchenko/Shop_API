class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :category, foreign_key: true
    add_reference :products, :seller, foreign_key: { to_table: :users }
    add_reference :products, :customer, foreign_key: { to_table: :users }
    add_reference :users, :seller_profile, foreign_key: true
    add_reference :users, :customer_profile, foreign_key: true
  end
end
