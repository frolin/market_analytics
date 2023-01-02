require "image_processing/mini_magick"

class Image < ApplicationRecord
  include ImageUploader::Attachment(:image)


  belongs_to :source, polymorphic: true
end
