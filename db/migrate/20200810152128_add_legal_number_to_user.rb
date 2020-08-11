class AddLegalNumberToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :legal_number, :string
    add_column :users, :lastname, :string
  end
end
