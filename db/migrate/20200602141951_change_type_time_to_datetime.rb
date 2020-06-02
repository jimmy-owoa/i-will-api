class ChangeTypeTimeToDatetime < ActiveRecord::Migration[6.0]
  def change
    remove_column :lists, :start_date
    remove_column :lists, :end_date
    add_column :lists, :start_date, :datetime
    add_column :lists, :end_date, :datetime
  end
end
