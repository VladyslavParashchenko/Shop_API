class AddTokenToSellerProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :seller_profiles, :stripe_token, :string
    add_column :seller_profiles, :card_token, :string
  end
end
