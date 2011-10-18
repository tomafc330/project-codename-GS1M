class Image < ActiveRecord::Base

  mount_uploader :url, ImageUploader
  belongs_to :listing

end
