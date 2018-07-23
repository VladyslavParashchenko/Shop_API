class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.references :customer
      t.references :product
      t.float :total_sum
      t.float :seller_sum
      t.integer :tax_percent
      t.string :status
      t.string :stripe_charge_id
      t.timestamps
    end
  end
end
