class DeleteColumnThatAreNotNeeded < ActiveRecord::Migration[5.2]
  def change
    remove_column :seller_profiles, :card_number
    remove_column :seller_profiles, :card_token
    remove_column :customer_profiles, :card_number
  end
end
