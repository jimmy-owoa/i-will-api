class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :amount
      t.boolean :is_multiple
      t.references :task_type, null: false, foreign_key: true
      t.references :measure_unit, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
