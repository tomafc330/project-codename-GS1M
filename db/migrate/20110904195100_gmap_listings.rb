class GmapListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :latitude, :float
    add_column :listings, :longitude, :float
    add_column :listings, :gmaps, :boolean
  end

  def self.down
    remove_column :listings, :latitude
    remove_column :listings, :longitude
    remove_column :listings, :gmaps
  end
end
