class AddStripeTokenToCustomerProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :customer_profiles, :stripe_customer_token, :string
  end
end
