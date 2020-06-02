class AddSlugToLists < ActiveRecord::Migration[6.0]
  def change
    change_column :lists, :slug, :string
    add_index :lists, :slug, unique: true
  end
end
