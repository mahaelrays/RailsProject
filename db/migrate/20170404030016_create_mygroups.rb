class CreateMygroups < ActiveRecord::Migration[5.0]
  def change
    create_table :mygroups do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
