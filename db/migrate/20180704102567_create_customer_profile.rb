class CreateCustomerProfile < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_profiles do |t|
      t.string :card_number
      t.timestamps
    end
  end
end
