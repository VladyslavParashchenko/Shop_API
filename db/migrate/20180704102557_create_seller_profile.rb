class CreateSellerProfile < ActiveRecord::Migration[5.2]
  def change
    create_table :seller_profiles do |t|
      t.string :card_number
      t.timestamps
    end
  end
end
