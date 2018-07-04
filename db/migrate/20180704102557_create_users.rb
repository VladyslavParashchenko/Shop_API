class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :title
      t.text :description
      t.string :image
      t.float :price
      t.integer :status
      t.timestamps
    end
  end
end
