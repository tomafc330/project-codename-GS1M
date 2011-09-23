class RemoveStartDayFromListings < ActiveRecord::Migration
  def self.up
    remove_column :listings, :start_day
  end

  def self.down
    add_column :listings, :start_day, :date
  end
end
