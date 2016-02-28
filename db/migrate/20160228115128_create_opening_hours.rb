class CreateOpeningHours < ActiveRecord::Migration
  def change
    create_table :opening_hours do |t|
      t.integer  :day_of_week
      t.time     :open_time
      t.time     :close_time

      t.timestamps
    end
  end
end
