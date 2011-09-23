class RemoveEndDayFromListings < ActiveRecord::Migration
  def self.up
    remove_column :listings, :end_day
  end

  def self.down
    add_column :listings, :end_day, :date
  end
end
