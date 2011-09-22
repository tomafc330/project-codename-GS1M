class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.string :description
      t.string :address
      t.date :start_day
      t.date :end_day
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
