class Listing < ActiveRecord::Base
  attr_accessor :image
  
  acts_as_gmappable
  geocoded_by :address
  after_validation :geocode

  validates_format_of :email,
    :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i

  def gmaps4rails_address
    "#{self.address}"
  end

  has_many :images, :dependent => :destroy
  has_and_belongs_to_many :options
  accepts_nested_attributes_for :images
end
