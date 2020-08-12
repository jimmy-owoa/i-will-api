class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.datetime :approved_at
      t.datetime :desactivated_at
      t.references :group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
