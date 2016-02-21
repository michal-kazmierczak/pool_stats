class AddDayOfWeekToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :day_of_week, :integer, null: false
    add_index :entries, :day_of_week
  end
end
