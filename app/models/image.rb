# == Schema Information
#
# Table name: images
#
#  id          :bigint           not null, primary key
#  name        :string
#  source_type :string           not null
#  source_id   :bigint           not null
#  image_data  :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "image_processing/mini_magick"

class Image < ApplicationRecord
  include ImageUploader::Attachment(:image)


  belongs_to :source, polymorphic: true
end
