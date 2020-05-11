class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :starts
      t.date :ends

      t.timestamps
    end
  end
end
