class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.string :item
      t.integer :amount
      t.string :comment
      t.integer :price
      t.references :order, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
