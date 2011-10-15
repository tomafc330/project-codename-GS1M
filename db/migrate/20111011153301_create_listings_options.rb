class CreateListingsOptions < ActiveRecord::Migration
def self.up
	create_table :listings_options, :id => false do |t|
	t.references :listing
	t.references :option
	end
end

def self.down
	drop_table :listings_options
end
	
end
