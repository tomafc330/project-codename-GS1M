class Listing < ActiveRecord::Base
  acts_as_gmappable
  geocoded_by :address
  after_validation :geocode

  def gmaps4rails_address
    "#{self.address}"
  end
end
