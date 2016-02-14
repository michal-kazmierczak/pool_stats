class CreateEntries < ActiveRecord::Migration
  def change
  	create_table :entries do |t|
      t.integer  :swimmers
      t.string   :device_id
      t.datetime :date

      t.timestamps
    end
  end
end
