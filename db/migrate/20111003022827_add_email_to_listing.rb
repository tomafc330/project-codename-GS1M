class AddEmailToListing < ActiveRecord::Migration
  def self.up
    add_column :listings, :email, :string
  end

  def self.down
    remove_column :listings, :email
  end
end
