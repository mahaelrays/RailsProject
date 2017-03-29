class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends, id: false do |t|
      t.references :user, foreign_key: true
      t.integer :friend_id
      # t.timestamps
    end
    add_foreign_key :friends ,:users ,column: :friend_id
  end
end
