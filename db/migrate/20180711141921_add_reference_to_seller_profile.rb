class AddReferenceToSellerProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :seller_profiles, :plan, foreign_key: { to_table: :plans }
    add_column :seller_profiles, :subscription_at, :datetime
    add_column :seller_profiles, :subscription_expires_at, :datetime
    add_column :seller_profiles, :stripe_customer_id, :string
  end
end
