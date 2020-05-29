class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.time :start_date
      t.time :end_date
      t.string :description
      t.string :code
      t.string :slug
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
