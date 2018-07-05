class DeleteRelationAndCreateNewRelation < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :seller_profile, foreign_key: true
    remove_reference :users, :customer_profile, foreign_key: true
    add_reference :seller_profiles, :seller, foreign_key: { to_table: :users }
    add_reference :customer_profiles, :customer, foreign_key: { to_table: :users }
  end
end
