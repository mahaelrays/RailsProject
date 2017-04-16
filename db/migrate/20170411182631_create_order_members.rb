class CreateOrderMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :order_members do |t|
      t.references :order, foreign_key: true
      t.references :user, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
